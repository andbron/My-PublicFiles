param (
    [Parameter()]
    # Temp directory for tfsec binary and test result (default $ENV:TEMP)
    [String] $tempDirectory=$ENV:TEMP,
    # Operating system (default $ENV:OS)
    [String] $os=($ENV:OS ?? "Windows_NT"),
    # Avoid using rules from "code/testing/tf/tfsec/global_config.json" (default $false)
    [String] $disableGlobalTFSecRules=($ENV:disableGlobalTFSecRules ?? $false)
)

Describe "Terraform" {

    Context "tfsec" -Tag "all" {

        BeforeAll {
            if ($null -ne $ENV:PIPELINE_WORKSPACE){
                $os=$ENV:AGENT_OS
                $tempDirectory=$ENV:AGENT_TEMPDIRECTORY
                Write-Verbose "INFO: Detected running inside pipeline setting temp [$tempDirectory], os [$os]"
            }

            if ($null -eq $ENV:SYSTEM_ACCESSTOKEN) {
                throw 'Please set the DevOps access token in $ENV:SYSTEM_ACCESSTOKEN ...'
            }
            $PAT=$ENV:SYSTEM_ACCESSTOKEN
            git config --global credential.helper "!f() { sleep 1; echo `"username=$($PAT)`"; echo `"password=$($PAT)`"; }; f"
            
            Write-Verbose "INFO: disableGlobalTFSecRules: [$disableGlobalTFSecRules]"
            Write-Verbose "INFO: tempDirectory: [$tempDirectory]"
            
            Write-Verbose "tfSec"


            
            New-Item -Type Directory temp_sec | Write-Verbose
            Set-Location temp_sec | Write-Verbose
            Copy-Item ..\* . -Recurse -Exclude "temp_sec" | Write-Verbose
            # Remove-Item backend.tf -Force -ErrorAction SilentlyContinue # this action is required to enable SCa to run against non-module tf code
            
            New-Item -Type Directory ".tfsec" -Force | Write-Verbose
            if ($disableGlobalTFSecRules -eq $false) {
                Write-Verbose "Get global tfsec checks"
                Copy-Item (Join-Path $PSScriptRoot "../tf/tfsec/*tfchecks.json") ./.tfsec/ -Force
                Copy-Item (Join-Path $PSScriptRoot "../tf/tfsec/global_config.json") ./.tfsec/config.json -ErrorACtion SilentlyContinue
            }
            
            terraform init | Write-Verbose
            terraform workspace new stagename | Write-Verbose
            terraform workspace select stagename | Write-Verbose
            
            # Install tfsec if not already present
            if ($null -eq (Get-Command "tfsec" -ErrorAction SilentlyContinue)) {
                Write-Verbose "Install tfsec"
                if ($os -match "Windows"){
                    if (!(Test-Path "$tempDirectory/tfsec.exe")) {
                        Invoke-Webrequest -uri "https://github.com/aquasecurity/tfsec/releases/download/v1.28.1/tfsec-windows-amd64.exe" -outfile "$tempDirectory/tfsec.exe"
                    }
                    if (!($ENV:PATH -match [regex]::Escape($tempDirectory))) {
                        $ENV:PATH = "$ENV:PATH;$tempDirectory"
                    }
                }
                else {
                    # $tempDirectory=$ENV:HOME
                    if (!(Test-Path "$tempDirectory/tfsec")) {
                        Invoke-Webrequest -uri "https://github.com/aquasecurity/tfsec/releases/download/v1.28.1/tfsec-linux-amd64" -outfile "$tempDirectory/tfsec"
                        sudo install -c -v "$tempDirectory/tfsec" "/usr/local/bin"
                    }
                }
            }
            
            Write-Verbose "Run tfsec"
            $tfsecResult = tfsec --format=json --include-passed --soft-fail
            $tfsecResult = $tfsecResult | ConvertFrom-Json -Depth 20


            # $tfsecResults = $tfsecResult | ConvertFrom-Json -Depth 100
            $fail0 = $tfsecResult.results | Where-Object {$_.status -eq 0}
            $pass1 = $tfsecResult.results | Where-Object {$_.status -eq 1}
            Write-Host "############################### TFSec Tests Passed: $($pass1.count) ###############################"
            # $pass1 | ConvertTo-Json -Depth 20 | Write-Host
            Write-Host "############################### TFSec Tests Failed: $($fail0.count) ###############################"
            # $fail0 | ConvertTo-Json -Depth 20 | Write-Host

            Set-Location ..
            Remove-Item .\temp_sec\ -Recurse -Force
        }

        It "has no errors" {
            $tfsecResult.results | Where-Object {$_.status -ne "1"} | Should -HaveCount 0
        }

    }

}