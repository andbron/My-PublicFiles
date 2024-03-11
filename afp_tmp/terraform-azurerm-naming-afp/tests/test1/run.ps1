[CmdletBinding()]
param (
    [Parameter()]
    [string]
    $tfvarsfile
)

# Note: the test folder must be renamed from sample. sample is ignored.
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path


$test_config = Get-Content (Join-Path $ScriptPath "config.json") | ConvertFrom-Json
Set-Location $scriptPath
if ($test_config.plan -eq $true) {
    Write-output "Running test init and plan"
    terraform init         

    if ($tfvarsfile) {
        terraform plan -out state.tfplan -var-file $tfvarsfile
    }
    else {
        terraform plan -out state.tfplan
    }
        

    terraform show -json state.tfplan
    try {
        if ($test_config.apply -eq $true) {
            Write-Output "Running test apply"
            terraform apply "state.tfplan"
    
            if ($test_config.destroy -eq $true) {
                Write-Output "Running test destroy"
                terraform destroy -auto-approve
            }
        }
    }
    catch {
        Throw "An error occurred during unit test execution (apply or destroy phase)"
    }
    
}
