BeforeDiscovery {
    # Find all Tests
    $allTests = Get-ChildItem build/tests -Directory -ErrorAction SilentlyContinue

    $allTestsPrefix = "UT"

    forEach ($item in $allTests) {
        $testConfig = Get-Content (Join-Path $item.fullname "test_config.json") | ConvertFrom-Json -Depth 5
        if (!($testConfig.testsDisabled)) {
            [array]$testInputs += @{
                testName = $item.name
                testPath = $item.fullname
                stageName = $testConfig.stageName
                ecpPath = $testconfig.ecpPath
                plan = $testconfig.plan ?? $true
                apply = $testconfig.apply ?? $true
                destroy = $testconfig.destroyAfterTest ?? $true
                testPrefix = $allTestsPrefix + ($testconfig.ecpPath -split "/")[-1] + $item.name
                dependencies = $testConfig.dependsOnSolution
            }
        }
    }   
}

BeforeAll {
    Function Deploy-ECPTestStage {
        [CmdletBinding()]
        param (
    
            [Parameter()]
            [String]
            $testPath,

            $isDependency,

            $ecpPath,

            $stageName
        )

        $testConfig = Get-Content (Join-Path $testPath "test_config.json") | ConvertFrom-Json -Depth 5
        # $ecpPath = $testConfig.ecpPath
        # $stageName = $testConfig.StageName
        $plan = $isDependency -eq $true ? $true : $testConfig.plan
        $apply = $isDependency -eq $true ? $true : $testConfig.apply
    
        $targetLocation = Join-Path $testDrive $ecpPath
        Write-Host $targetLocation
        New-Item -Path $targetLocation -ItemType Directory -Force
    
        # Run Test Deployment
        Copy-Item -Path (Join-Path $testPath "..\..\..\*") -Destination $targetLocation -Force
        Copy-Item -Path (Join-Path $testPath "*.json") -Destination $targetLocation -Force
        Rename-Item (Join-Path $targetLocation "stage-config.json") -NewName "$stageName.json"
        
        @{stageObjectList = @(@{stageChangeSequence="1";name=$stageName})} | ConvertTo-Json | Set-Content (Join-Path $targetLocation "node_stages.json")
    
        Set-Location $targetLocation
        if ($apply -ne $false) {
            Deploy-ECPTerraformStage -stageName $stageName -ecControlPath $ecControlPath -ResourceGroupPrefix $testPrefix -supressWarnings
        } else {
            if ($plan -ne $false) {
                Deploy-ECPTerraformStage -stageName $stageName -ecControlPath $ecControlPath -ResourceGroupPrefix $testPrefix -planOnly -supressWarnings
            }
        }      
    }
    
}

Describe "Unit Testing" {
    BeforeAll {
        # TODO Perform/Check Az Login
        # TODO Check that logged on user had contributor permissions on a subscroption?
        # TODO Check Terraform installed

        git config --global core.longpaths true

        $originalWorkingDir = $pwd #Capture this so that the use can be returned to their original working directory at the end of testing

        $thispath = $PSCommandPath
        Write-Host "Path of this Pester script : $thispath"
        $ecControlPath = Resolve-Path (Join-Path $thispath "../../../../..")
        Write-Host "EC Control Path : $ecControlPath"
        Import-Module (Join-Path $ecControlPath "code\cli\AzECP-devops.psm1") -Force
    }

    Context "Template Test" -ForEach $testInputs {
        BeforeAll {
            Write-Host "#############################"
            Write-Host "#    Deploy Dependencies    #"
            Write-Host "#############################"
            ForEach ($item in $dependencies){
                $templatesPath = Join-Path ($testPath -split "code.templates")[0] "code/templates"
                $resolvedTestPath = (Resolve-Path (Join-Path $templatesPath $item.testPath)).Path
                Write-Host "Deploy dependency [$($item.ecpPath)] stage [$($item.stagename)] from location [$resolvedTestPath]"
                Deploy-ECPTestStage -testPath $resolvedTestPath -isDependency $true -ecpPath $item.ecpPath -stageName $item.stageName
            }
            
            Write-Host "#############################"
            Write-Host "#       Execute Test        #"
            Write-Host "#############################"
            Write-Host "Deploy test [$ecpPath] stage [$stagename] from location [$testPath]"
            Deploy-ECPTestStage -testPath $testPath -ecpPath $ecpPath -stageName $stageName
        }

        It "Test Dependencies all deployed correctly" {
            ForEach ($item in $dependencies){
                Join-Path $testDrive $item.ecpPath "apply_output.json" | Should -Exist
                Get-Content (Join-Path $testDrive $item.ecpPath "apply_output.json") | ConvertFrom-Json -Depth 10 | Where-Object {$_."@level" -eq "error"} | Should -Be $null -Because "if there are errors, the deployment of test dependencies was not successful"
            }
        }
        
        # Check Results
        It "Terraform Plan completed successfully" {
            Join-Path $testDrive $ecpPath "state.tfplan" | Should -Exist
            Test-Path (Join-Path $testDrive $ecpPath "state.tfplan")| Should -Be $true -Because "a successful plan will produce a plan file"
        }

        It "Terraform Plan has no errors" {
            Get-Content (Join-Path $testDrive $ecpPath "plan_output.json") | ConvertFrom-Json -Depth 10 | Where-Object {$_."@level" -eq "error"} | Should -Be $null -Because "if there are errors, the deployment was not successful"
        }

        #Check for existence of state file
        It "<testName> A state file was created" {
            $workspacename = $stageName -split "\."
            $workspacename[2] = $TestPrefix + "-" + $workspacename[2]
            $workspacename = $workspacename -join "."
            (Join-Path $testDrive $ecpPath "terraform.tfstate.d\$workspacename\terraform.tfstate") | Should -Exist -Because "successful Terraform deployments will always create a state file"
        }

        #check for other things in state file - eg. count the resources

        It "Terraform Apply should have no errors" {
            Join-Path $testDrive $ecpPath "apply_output.json" | Should -Exist
            Get-Content (Join-Path $testDrive $ecpPath "apply_output.json") | ConvertFrom-Json -Depth 10 | Where-Object {$_."@level" -eq "error"} | Should -Be $null -Because "if there are errors, the deployment was not successful"
        }

        It "Test [<testName>] is configured for cleanup" {
            if ($apply -ne $false){
                $destroy | Should -Be $true -Because "the resources from this deployment must be cleaned up. Cleanup must now be carried out manually. Test Name: [$testName] Ecp Path: [$ecpPath] Test Prefix: [$testPrefix]"
            }
        }

        AfterAll {
            # Destroy Test Deployment
            if ($apply -ne $false){ #If there was no apply, then do not run destroy
                if ($destroy -ne $false) {
                    Write-Host "#############################"
                    Write-Host "#       Destroy Test        #"
                    Write-Host "#############################"
                    Write-Host "Deploy test [$ecpPath] stage [$stagename] from location [$testPath]"
                    Set-Location (Join-Path $testDrive $ecpPath)
                    Deploy-ECPTerraformStage -stageName $stageName -ecControlPath $ecControlPath -ResourceGroupPrefix $testPrefix -destroy -supressWarnings

                    # Destroy Dependencies
                    Write-Host "#############################"
                    Write-Host "#    Destroy Dependencies   #"
                    Write-Host "#############################"
                    [array]::Reverse($dependencies)
                    ForEach ($item in $dependencies){
                        $templatesPath = Join-Path ($testPath -split "code.templates")[0] "code/templates"
                        $resolvedTestPath = (Resolve-Path (Join-Path $templatesPath $item.testPath)).Path
                        Write-Host "Destroy dependency [$($item.ecpPath)] stage [$($item.stagename)] from location [$resolvedTestPath]"
                        Set-Location (Join-Path $testDrive $item.ecpPath)
                        Deploy-ECPTerraformStage -stageName $item.StageName -ecControlPath $ecControlPath -ResourceGroupPrefix $testPrefix -destroy -supressWarnings
                    }
                } else {
                    Write-Host "Destroy will be skipped - the resources from this deployment must be manually cleaned up. Test Name: [$testName] Ecp Path: [$ecpPath] Test Prefix: [$testPrefix] Dependencies [$dependencies]"
                }
            }
        }
    }


    AfterAll {
        Set-Location $originalWorkingDir

        # TODO: ? Complete Fail cleanup ? (delete resource Groups? search for RGs that contain the resourcegroupprefix and delete) 
    }
}