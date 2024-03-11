Describe "Terraform" {

    Context "Validate" -Tag "all" {

        BeforeAll {
            if ($null -eq $ENV:SYSTEM_ACCESSTOKEN) {
                throw 'Please set the DevOps access token in $ENV:SYSTEM_ACCESSTOKE ...'
            }
            $PAT=$ENV:SYSTEM_ACCESSTOKEN
            git config --global credential.helper "!f() { sleep 1; echo `"username=$($PAT)`"; echo `"password=$($PAT)`"; }; f"

            New-Item -Type Directory temp_validate | Write-Verbose
            Set-Location temp_validate
            Copy-Item ..\* . -Recurse -Exclude "temp_validate"
            Remove-Item backend.tf -Force -ErrorAction SilentlyContinue # this action is required to enable SCA to run against non-module tf code

            # $dirChar = "\$([IO.Path]::DirectorySeparatorChar)"
            # if ($pwd -notmatch "$($dirChar).*$($dirChar).*$($dirChar)cores") {
            #     #Only run when validating Modules
            #     #This code is needed to enable validation of multi-provider TF modules. Its a bit of a hack, but the only alternative was to remove tf validate all together.
            #     ForEach ($tffile in (Get-ChildItem *.tf -Recurse)) {
            #         (Get-Content $tffile) -replace "(^|`\s)provider`\s*=", "#provider =" -replace "(^|`\s)configuration_aliases`\s*=", "#configuration_aliases =" | Set-Content $tffile
            #     }
            # }



            #This code is needed to enable validation of multi-provider TF modules. Its a bit of a hack, but the only alternative was to remove tf validate all together.
            ForEach ($tffile in (Get-ChildItem *.tf -Recurse)) {
                (Get-Content $tffile) -replace "(^|`\s)provider`\s*=", "#provider =" -replace "(^|`\s)configuration_aliases`\s*=", "#configuration_aliases =" | Set-Content $tffile
            }


            terraform init | Write-Verbose
            terraform workspace new stagename | Write-Verbose
            terraform workspace select stagename | Write-Verbose
            $result = terraform validate -json
            
            $diagnostics = ( $result | ConvertFrom-Json -Depth 20 ).diagnostics
            if ( $diagnostics.Count -eq 0 ) {
                Write-Verbose "`nTerraform code is valid!"
            } else {
                Write-Verbose "`nTerraform validate output: "
                $diagnostics | Select-Object Severity,Detail -ExpandProperty Range | Select-Object Severity,Detail,Filename,Start,End | Format-List | Out-String | Write-Verbose
            }

            #Tidy up temp code so that it doesn;t cause issues with the next SCA tasks
            Set-Location ..
            Remove-Item .\temp_validate\ -Recurse -Force
        }

        It "has no errors" {
			$diagnostics | Where-Object {$_.severity -eq "error"} | Should -Be $null
		}

    }

}
