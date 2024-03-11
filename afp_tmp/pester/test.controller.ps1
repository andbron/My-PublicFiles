param (
    [String] $path = $pwd,
    [Object] $PesterConfiguration = $null
)

Import-Module Pester
# Import-Module (Join-Path $PSScriptRoot "..\..\cli\src\EcpModule.psm1") -Force

$tags       = $null
$includeTag = $null
# $dirChar    = "\$([IO.Path]::DirectorySeparatorChar)"
$parent = (get-item $path).name

switch ($path) {
    {($parent -eq "subscriptions")}  { $includeTag = @("all", "platform");   break }
    # {($parent -eq "governance")}  { $includeTag = @("all", "governance"); break }
    default {
        if ((test-path "$path/CHANGELOG.md") -and (test-path "$path/README.md")) { $includeTag = @("all", "tfModule") }
    }
}

if ($null -ne $includeTag) {
    $tags = @{
        include = $includeTag
    }
    # if ($includeTag -eq "config") {
    #     $set = @("base", "service", "team", "policy")
    #     $node = Get-EcpNodeFromPath($path)
    #     if (@("core","hub","spoke").Contains($node.type)) {
    #         $tags | Add-Member -MemberType NoteProperty -Name 'exclude' -Value ($set | Where-Object { $_ -ne "base" })
    #     } else {
    #         $tags | Add-Member -MemberType NoteProperty -Name 'exclude' -Value ($set | Where-Object { $_ -ne $node.type })
    #     }
    # }

    if ($includeTag -eq "tfModule") {
        $set = @("platform")
        $tags | Add-Member -MemberType NoteProperty -Name 'exclude' -Value $set
    }


} else {
    throw "Cannot identify the test type from path [$path] ..."
}

# TODO: need to find a way to use the YAML variable to control tests
# Install-YamlModule
# $vars = (Get-Content .\pipeline\Release\multiStage-Vars.yml | ConvertFrom-yaml)
# $global = (Get-Content $ENV:PIPELINE_WORKSPACE\control\code\pipeline\AzureDevOps\instanceVariables.yml | ConvertFrom-yaml)
# $enableTFValidate           = $vars.variables.enableTFValidate -or $global.variables.enableTFValidate
# $enableTFLint               = $vars.variables.enableTFLint -or $global.variables.enableTFLint
# $enableTFSec                = $vars.variables.enableTFSec -or $global.variables.enableTFSec
# $enablePester               = $vars.variables.enablePester -or $global.variables.enablePester
# $disableGlobalTFLintRules   = $vars.variables.disableGlobalTFLintRules -or $global.variables.disableGlobalTFLintRules
# $disableGlobalTFSecRules    = $vars.variables.disableGlobalTFSecRules -or $global.variables.disableGlobalTFSecRules

Write-Host "include: [$($tags.include)]"
Write-Host "exclude: [$($tags.exclude)]"

if ($null -eq $PesterConfiguration) { $PesterConfiguration = [PesterConfiguration]::Default }
$PesterConfiguration.Run.Path           = "$PSScriptRoot"
$PesterConfiguration.Run.PassThru       = ($PesterConfiguration.Run.PassThru ?? $true)
$PesterConfiguration.Filter.Tag         = $tags.include
$PesterConfiguration.Filter.ExcludeTag  = ($tags.exclude ?? @())
$PesterConfiguration.Output.Verbosity   = "Diagnostic"

$result = Invoke-Pester -Configuration $PesterConfiguration
return $result