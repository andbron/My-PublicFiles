param (
    [Parameter()]
    # Temp directory for tflint binary and test result (default $ENV:TEMP)
    [String] $tempDirectory=$ENV:TEMP,
    # Operating system (default $ENV:OS)
    [String] $os=($ENV:OS ?? "Windows_NT"),
    # Avoid using rules from "$workspace/control/code/testing/tf/tflint/.global.tflint.hcl" (default $false)
    [String] $disableGlobalTFLintRules=($ENV:disableGlobalTFLintRules ?? $false)
)

Describe "Terraform" {

    Context "tflint" -Tag "all" {

        BeforeAll {
            if ($null -ne $ENV:PIPELINE_WORKSPACE){
                Write-Verbose "INFO: Detected running inside pipeline"
                $tempDirectory=$ENV:AGENT_TEMPDIRECTORY
                $os=$ENV:AGENT_OS
            }
            
            if ($os -notmatch "Windows") {
                $unameOut=$(uname -a)
                if ((($unameOut).Split(' ')[2]).Split('-')[-1] -eq "WSL2") {
                    $os= "WSL2"
                    $tempDirectory = $ENV:HOME
                }
            }

            Write-Verbose "INFO: tempDirectory: [$tempDirectory]"
            Write-Verbose "INFO: disableGlobalTFLintRules: [$disableGlobalTFLintRules]"
            
            if ($disableGlobalTFLintRules -eq $false) {
                Write-Verbose "Get global tflint configuration"
                $tfLintConfig = "$(Resolve-Path(Join-Path $PSScriptRoot '../tf/tflint/.global.tflint.hcl'))"
            } else {
                $tfLintConfig = ".tflint.hcl"
            }
            
            if (Test-Path ".tflint.override.json") {
                $tflintOverride = get-content .\.tflint.override.json | ConvertFrom-Json
                forEach ($r in $tflintOverride.disablerules){
                    $disableRules += "--disable-rule=$r "
                }
                Write-Verbose "INFO: Rules to disable [$disableRules]"
            }
            
            # Install tflint is not already present
            if ($null -eq (Get-Command "tflint" -ErrorAction SilentlyContinue)) {
                # Edge Case - Detecting OS on WSL2 calculates incorrectly so setting tempDirectory here
                # if ($null -eq $tempDirectory) {
                #     $tempDirectory = $ENV:HOME
                #     # $tempDirectory = "./temp_lint"
                #     # New-Item -Type Directory $tempDirectory
                #     # $lintPath = Join-Path $pwd ($tempDirectory.Split('./')[1])
                #     # $ENV:PATH = "$ENV:PATH;$lintPath"
                # }
                if (!(Test-Path "$tempDirectory/tflint.zip")) {
                    Write-Verbose "Install tflint"
                    if ($os -match "Windows") {
                        Invoke-Webrequest -uri "https://github.com/terraform-linters/tflint/releases/download/v0.49.0/tflint_$($os -replace '_NT','')_amd64.zip" -outfile "$tempDirectory/tflint.zip"
                    } else {
                        Invoke-Webrequest -uri "https://github.com/terraform-linters/tflint/releases/download/v0.49.0/tflint_linux_amd64.zip" -outfile "$tempDirectory/tflint.zip"
                    }
                    Expand-Archive -Force "$tempDirectory/tflint.zip" $tempDirectory
                }
            
                if ($os -match "Windows") {
                    if (!($ENV:PATH -match [regex]::Escape($tempDirectory))) {
                        $ENV:PATH = "$ENV:PATH;$tempDirectory"
                    }
                }
                else {
                    sudo install -c -v "$tempDirectory/tflint" "/usr/local/bin"
                }
            }
            
            Write-Verbose "Run tflint"

            if ($os -match "Windows" -or $os -match "WSL2") {
                $ENV:TFLINT_LOG='trace tflint'
            } else {
                export TFLINT_LOG='trace tflint'
            }
            
            tflint --init --config $tfLintConfig | Write-Warning
            tflint --config $tfLintConfig --force $disableRules | Write-Warning
            # tflint --loglevel info --config $tfLintConfig --force $disableRules | Write-Warning

            $tflintResult = tflint --format json --config $tfLintConfig
            $tflintResult = $tflintResult | ConvertFrom-Json -Depth 20

            if ($tflintResult.errors.Count -gt 0) {
                write-verbose "Errors:"
                $tflintResult.errors | Format-List | Out-String | Write-Verbose
            }
            
            if ($tflintResult.issues.Count -gt 0) {
                write-verbose "Issues:"
                $tflintResult.issues | Select-Object Message,Range -ExpandProperty Rule | Select-Object Name,Severity,Message,Range,Link | Format-List | Out-String | Write-Verbose
            }
        }
    
        it "has no findings" {
            $tflintResult.issues | Should -HaveCount 0
        }

    }

}