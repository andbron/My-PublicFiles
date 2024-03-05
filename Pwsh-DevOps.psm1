Function New-TFPlanMarkdownSummary {
    <#
        .SYNOPSIS
            Summarises Terraform Plan outputs in Markdown format

        .DESCRIPTION
            This function reads in a JSON formatted Terraform plan, and Terraform Plan Standard Output, and produces a Markdown summary. This markdown is attached to pipeline runs to give operators a single place to review all Terraform plan output for their pipeline run.

        .EXAMPLE
            New-TFPlanMarkdownSummary -tfplanjsonpath C:\temp\state.tfplan.json -tfplanstdoutpath C:\temp\state.tfplan.stdout

        .EXAMPLE
            $markdown = New-TFPlanMarkdownSummary -tfplanjsonpath C:\temp\state.tfplan.json -tfplanstdoutpath C:\temp\state.tfplan.stdout
            $markdown | Set-Content c:\temp\markdownsummary.md
    #>

    [CmdletBinding()]
    param (
        # The Path to a JSON formatted Terraform plan
        [Parameter()]
        [String]
        $tfplanjsonpath,

        # The Path to terraform plan standard output
        [Parameter()]
        [String]
        $tfplanstdoutpath
    )

    $tfplancontent = Get-Content $TFPlanJsonPath |ConvertFrom-Json -Depth 20

    $resource_changes = $tfplancontent.resource_changes | Where-Object { ($_.change.actions -ne 'no-op') -and ($_.change.actions -ne 'read') }
    $output_changes = $tfplancontent.output_changes.PSObject.Properties.Value.actions | Where-Object {$_ -ne 'no-op'}
    $report = @{
        creates = @()
        updates = @()
        deletes = @()
    }

    foreach ($item in $resource_changes)
    {
        $message = "$($item.name) => $($item.type)"
        $diff = Compare-Object (($item.change.before | ConvertTo-Json -Depth 20) -split '\r?\n') (($item.change.after | ConvertTo-Json -Depth 20) -split '\r?\n')
        $containsSensitiveValues = ($item.change.after_sensitive|Convertto-json -depth 10 ) -match "true" -or ($item.change.before_sensitive|Convertto-json -depth 10 ) -match "true"

        if ($item.change.actions.Contains('create'))
        {
            $report.creates += @{
                name = $item.name
                message = $message
                diff = $diff
                containsSensitiveValues = $containsSensitiveValues
            }
        }

        if ($item.change.actions.Contains('update'))
        {
            $report.updates += @{
                name = $item.name
                message = $message
                diff = $diff
                containsSensitiveValues = $containsSensitiveValues
            }
        }

        if ($item.change.actions.Contains('delete'))
        {
            $report.deletes += @{
                name = $item.name
                message = $message
                diff = $diff
                containsSensitiveValues = $containsSensitiveValues
            }
        }
    }

    Function helper-table-cell-output {
        param (
            $item
        )
        if ($item.diff.count -lt 40){
            $table_cell += "<details><summary>$($item.message)<br></summary>"
            $table_cell += "(**experimental**) Diff of changes<br>"
            if ($item.containsSensitiveValues) {
                $table_cell += "``````"
                $table_cell += "This resource may contain sensitive values - diff will not be shown."
                $table_cell += "``````"
                $table_cell += "<br>"
            } else {
                $item.diff|ForEach-Object {

                    if ($_.InputObject.Trim().Length -gt 2){
                        $table_cell += "``````"
                        $table_cell += "$($_.InputObject) [ $($_.SideIndicator -replace ("=>", "Adding") -replace ("<=", "Removing")) ]"
                        $table_cell += "``````"
                        $table_cell += "<br>"
                    }
                }

            }
            $table_cell += "</details>"
        } else {
            $table_cell += "<details><summary>$($item.message)<br></summary>"
            $table_cell += "(**experimental**) Diff of changes<br>"
            $table_cell += "*Too many changes to display. See full TF Plan output*<br>"
            $table_cell += "</details>"
        }

        Return $table_cell
    }

    $plan_summary_content += "**Terraform Plan summary :**`r`n`n"

    $plan_summary_content += "$($report.creates.Length) to add, $($report.updates.Length) to change, $($report.deletes.Length) to destroy`r`n`n"

    if ($resource_changes.count -gt 0 -or $output_changes.count -gt 0) {
        foreach ($item in $report.creates) {
            $table_creates += helper-table-cell-output -item $item
        }

        foreach ($item in $report.updates) {
            $table_updates += helper-table-cell-output -item $item
        }

        foreach ($item in $report.deletes) {
            $table_deletes += helper-table-cell-output -item $item
        }

        $big_whitespace = "&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;"

        $plan_summary_content += "`n"
        $plan_summary_content += "| Creates$($big_whitespace) | Updates$($big_whitespace) | Deletes$($big_whitespace) |`n"
        $plan_summary_content += "| :------ | :----- | :------ |`n"
        $plan_summary_content += "| $($table_creates) | $($table_updates) | $($table_deletes) |`n"
        $plan_summary_content += "`n"

        $plan_summary_content += "Note: Due to readability limitations, resources in above table will only show a diff if there are less than 40 changes. Review the full plan output to view more extensive changes.`n"

        if ($ENV:SYSTEM_COLLECTIONURI){
            $buildUri = "$( $ENV:SYSTEM_COLLECTIONURI )/$( $ENV:SYSTEM_TEAMPROJECT )/_build/results?buildId=$( $ENV:BUILD_BUILDID )&view=logs"
            $plan_summary_content += "[Click to navigate to detailed log]($( $buildUri ))`r`n"
        }

        $plan_summary_content += "<details><summary><b>Full Terraform Plan Output:</b></summary>`n"
        $plan_summary_content += "`n```````n"

        $stdoutx = Get-Content $tfplanstdoutpath
        foreach ($item in $stdoutx) {
            $plan_summary_content += "$item `n"
        }
        $plan_summary_content += "`n```````n"
        $plan_summary_content += "</details>"


    } else {

        $plan_summary_content += "`r`nNo Changes !"
    }

    Return $plan_summary_content
}

Function Merge-Objects {
    <#
        .SYNOPSIS
            This function merges an array of objects together, and returns the merged object.
        .DESCRIPTION
            This function uses the Newtonsoft.Json.Linq.JsonMergeSettings class to simplify merging of an object without the need to define
            complex recursive child loops. Only fields that are of type Array, or PSCustomObject will be merged. For all other fields,
            the last occurance of the field name in an object will determine the value.

            A future enhancement will allow any object, or nested object to include the field "block_inheritance" to block further processing of subsequent objects.
            The concept here is by setting block_inheritance to and array of property names (eg block_inheritance = ["approvers","resource_type"]) will block
            inheritance of the specified properties from subsequent objects. Block_inheritance will be able to be used in and object structure, including nested objects.
            The scope of the block_inheritance behaviour will be the object (or nested object) in which it is defined, it will have no effect outside of that object.

        .EXAMPLE
            $object1 = [PSCustomObject]@{
                "a" = "a"
                "b" = "b"
                "c" = @("x","y")
            }

            $object2 = [PSCustomObject]@{
                "a" = "a"
                "b" = "bbb"
                "c" = @("z")
            }

            Merge-Objects -Objects @($object1, $object2)

            Result:
            Name                           Value
            ----                           -----
            a                              a
            b                              b
            c                              {x, y, z}

        .EXAMPLE
            $object1 = [PSCustomObject]@{
                "a" = "a"
                "b" = "b"
                "c" = @("x","y")
            }

            $object2 = [PSCustomObject]@{
                "a" = "a"
                "b" = "bbb"
                "c" = @("z")
            }

            $conbimedObject += $object1
            $combinedObject += $object2
            Merge-Objects -Objects $combinedObject

            Result:
            Name                           Value
            ----                           -----
            a                              a
            b                              bbb
            c                              {x, y, z}
    #>

    [CmdletBinding()]
    param (
        [Parameter()]
        [array]
        $objects
    )

    #remove null objects from array
    $objects = $objects | Where-Object {$_}

    $jms = New-Object Newtonsoft.Json.Linq.JsonMergeSettings
    $jms.MergeArrayHandling = [Newtonsoft.Json.Linq.MergeArrayHandling]::Union #Concat
    [array]$properties_to_not_merge = @()

    $mergedJson = [Newtonsoft.Json.Linq.JObject]::Parse("{}")  #empty json object, each config will merge into this

    foreach($item in $objects) {
        $content = ($item | ConvertTo-Json -Depth 20) # convert Object to JSON
        $content = [Newtonsoft.Json.Linq.JObject]::Parse($content) # parse string
        $content.tostring() | Write-Verbose
        foreach($property in $properties_to_not_merge){
            $split = $property -split "\."
            $parents = $split[0..($split.Count-2)] | ForEach-Object {".Item(`"$_`")"}
            $child = ".Remove(`"$($split[-1])`")"
            Invoke-Expression -command "`$content$parents$child" | Out-Null
        }
        if ($content.GetEnumerator().key -contains "block_inheritance"){
            [array]$properties_to_not_merge += $content["block_inheritance"].tostring() | ConvertFrom-Json
        }

        $mergedJson.Merge($content, $jms)
    }

    Return $($mergedJson.tostring() |ConvertFrom-Json -depth 20)
}

Function Get-ADOSubjectId {
    <#
        .SYNOPSIS
            This function queries Azure DevOps for a given identity object passed in and returns some critical attribute values.
        .DESCRIPTION
            This function uses the DevOps graph API to query Azure DevOps for a given identity or group object passed in.
            The function returns the subjectId, which is the unique identifier for the identity or group. The function also
            returns the displayName, which is the friendly name of the identity or group. Finally, the function returns the
            descriptor, which is the unique identifier for the identity or group, but in a different format to the subjectId.

        .EXAMPLE
            $reviewerGroup = "aCloud_Azure-Platform-AzureDevOps-ProjectAdmin"
            $reviewerDetailes = Get-ADOSubjectId -devops_organisation $devops_organisation -Subject $reviewerGroup -adoPAT $adoPAT
    #>

    Param (
        # Devops Organisation eg. "9025-CICD" - automatically populates when running from Devops Pipeline
        [String]$devops_organisation = ($ENV:SYSTEM_COLLECTIONURI -split ("/"))[3],

        # PAT Token to allow PR updates - automatically populates  with system_accesstoken when running from Devops Pipeline
        [Parameter()]
        [String]
        $adoPAT = $ENV:SYSTEM_ACCESSTOKEN,

        # The Name of the DevOps Team or User being added as a reviewer
        [Parameter()]
        [String]
        $Subject

    )

    Write-Verbose "Looking for subject [$Subject] in devops organisation [$devops_organisation]"
    #Build the Header with the PAT provided
    $user = ""
    $base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $User, $adoPAT)));
    $header = @{Authorization = ("Basic {0}" -f $base64AuthInfo) };

    #Subject lookup
    $urlRaw = "https://vssps.dev.azure.com/$devops_organisation/_apis/graph/subjectquery?api-version=6.0-preview.1"
    $urlRaw = [uri]::escapeuristring($urlRaw)
    $body = @{
        query = $Subject
        subjectKind = @("Group","User")
    }
    $lookupResult = Invoke-RestMethod -Method "POST" -Uri $urlRaw -ContentType "application/json" -Headers $header -Body ($body | ConvertTo-Json)

    if ($lookupResult.value.descriptor.count -gt 1){
        Throw "ERROR: The value supplied for \$Subject returned more than one match. Try using a more decriptive name."
    }
    if ($lookupResult.value.descriptor.count -lt 1){
        Throw "ERROR: The value supplied for \$Subject returned did not return a match. Try using a more decriptive name."
    }

    #Find correct ID
    $descriptor = $lookupResult.value.descriptor
    $urlRaw = "https://vssps.dev.azure.com/$devops_organisation/_apis/identities?subjectDescriptors=$($descriptor)&queryMembership=None&api-version=6.0"
    $urlRaw = [uri]::escapeuristring($urlRaw)
    $result = Invoke-RestMethod -Method "GET" -Uri $urlRaw -ContentType "application/json" -Headers $header
    $reviewer = @{
        id          = $result.value.id
        descriptor  = $result.value.descriptor
        displayName = $result.value.providerDisplayName
    }
    Return $reviewer
}

Function Set-BranchPolicyRequiredApprover {
    <#
        .SYNOPSIS
            Create a new Required Approver Branch Policy

        .DESCRIPTION
            Builds and creates a new branch policy if it does not exist

        .EXAMPLE
            New-BranchPolicy -devops_organisation "9025-CICD" -devops_project "ESLZ Platform" -branchName "main" targetPath "/root/Platform/Devsecops/Subscriptions" -Reviewers "ESLZ Platform Team" -adoPAT $adoPAT

        .EXAMPLE
            Example when calling from within a pipeline:
            Set-BranchPolicyRequiredApprover -targetPath "/root/Platform/Devsecops/Subscriptions" -Reviewers $mandatoryApprovers
    #>
    param (
        # Devops Org URL eg. https://dev.azure.com/org_name - automatically populates when running from Devops Pipeline
        [String]$devops_org_url = $ENV:SYSTEM_COLLECTIONURI,

        # Devops Org URL eg. (ESLZ Platform) - automatically populates when running from Devops Pipeline
        [String]$devops_team_project = $ENV:SYSTEM_TEAMPROJECT,

        # Repository ID eg. cf0b9451-ba2e-4ab5-857c-f806eb5edb9d (ESLZ Platform) - automatically populates when running from Devops Pipeline
        [String]$repositoryId = $ENV:BUILD_REPOSITORY_ID,

        # The name of the branch to add the policy - defaults to main
        [String]
        $branchName = "main",

        # The path in the Repo to which the required approvers will apply
        [Parameter(Mandatory)]
        [String]
        $targetPath,

        # A list of Azure Devops Users or Groups to be added as mandatory reviewers
        [Parameter(Mandatory)]
        [Array]
        $Reviewers,

        # PAT Token to allow Branch POlicy updates - automatically populates  with system_accesstoken when running from Devops Pipeline
        [Parameter()]
        [String]
        $adoPAT = $ENV:SYSTEM_ACCESSTOKEN

    )

    #Build the Header with the PAT provided
    $user = ""
    $base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $User, $adoPAT)));
    $header = @{Authorization = ("Basic {0}" -f $base64AuthInfo) };

    $devops_organisation = ($devops_org_url -split "/")[3]

    Write-Output "Check if branch policy Required Approvers for path [$($targetPath)] already exists for branch [$branchName]"

    #Get Existing Policies - GET https://dev.azure.com/{organization}/{project}/_apis/policy/configurations?api-version=7.1-preview.1
    $urlRaw = "$devops_org_url/$devops_team_project/_apis/policy/configurations?api-version=7.1-preview.1"
    $urlRaw = [uri]::escapeuristring($urlRaw)
    $result = Invoke-RestMethod -Method "GET" -Uri $urlRaw -ContentType "application/json" -Headers $header

    Write-Verbose "Branch Policies Found:"
    Write-Verbose "$($result | ConvertTo-Json -Depth 20)"

    $branchPolicies = $result.value | Where-Object {$_.settings.scope.repositoryId -eq $repositoryId -and $_.settings.scope.refname -eq "refs/heads/$branchname"}

    Write-Verbose "Branch Policies Found for repo [$repositoryId] branch [refs/heads/$branchname]:"
    Write-Verbose "$($branchPolicies | ConvertTo-Json -Depth 20)"

    Write-Output "INFO: Checking if a policy already exists for path [$($targetPath)]"
    $targetedPolicy = $branchPolicies | Where-Object {$_.settings.message -match "Path:\[$($targetPath)\]"}

    Write-Output "Targeted Policy Result:"
    Write-Output "$($targetedPolicy | ConvertTo-Json -Depth 20)"

    ForEach ($reviewer in $reviewers) {
        $reviewer = Get-ADOSubjectId -devops_organisation $devops_organisation -Subject $reviewer
        [array]$newReviewerIds += $reviewer.id
    }
    $ReviewersToAdd = $newReviewerIds

    [array]$pathFilterList = "$targetPath" + "*"
    $pathFilterList += "$targetPath" + "config/*"

    Switch ($targetedPolicy.count){
        {$_ -eq 1} {
                Write-Output "Branch policy Required Approvers for path [$($targetPath)] already exists for branch [$branchName]. Updating existing."
                # PUT https://dev.azure.com/{organization}/{project}/_apis/policy/configurations/{configurationId}?api-version=7.1-preview.1
                $urlRaw = "$devops_org_url/$devops_team_project/_apis/policy/configurations/$($targetedPolicy.Id)?api-version=7.1-preview.1"
                $urlRaw = [uri]::escapeuristring($urlRaw)
                $body = @{
                    isBlocking = $true
                    isEnabled = $true
                    type = $targetedPolicy.type
                    settings = @{
                        scope = $targetedPolicy.settings.scope
                        creatorVoteCounts = $false
                        requiredReviewerIds = $ReviewersToAdd
                        filenamePatterns = $targetedPolicy.settings.filenamePatterns
                        message = $targetedPolicy.settings.message
                    }
                }
                $result = Invoke-RestMethod -Method "PUT" -Uri $urlRaw -ContentType "application/json" -Headers $header -Body ($body | ConvertTo-Json -depth 20)

                # If this cmdlet if running as part of a PR, Remove Reviewers that are no longer required
                if ($ENV:BUILD_REASON -eq "PullRequest"){
                    $existingReviewerIds = $targetedPolicy.settings.requiredReviewerIds
                    $ReviewersToRemove = Compare-Object -ReferenceObject $newReviewerIds -DifferenceObject $existingReviewerIds -PassThru |where-Object {$_.SideIndicator -eq "=>"}
                    ForEach ($reviewer in $ReviewersToRemove){
                        # DELETE https://dev.azure.com/{organization}/{project}/_apis/git/repositories/{repositoryId}/pullRequests/{pullRequestId}/reviewers/{reviewerId}?api-version=7.1-preview.1
                        $urlRaw = "$devops_org_url/$devops_team_project/_apis/git/repositories/$($RepositoryId)/pullRequests/$($ENV:SYSTEM_PULLREQUEST_PULLREQUESTID)/reviewers/$($reviewer)?api-version=7.1-preview.1"
                        $urlRaw = [uri]::escapeuristring($urlRaw)
                        $result = Invoke-RestMethod -Method "DELETE" -Uri $urlRaw -ContentType "application/json" -Headers $header
                    }
                }
        }

        {$_ -eq 0} {
            #No existing branch policy found - create a new one POST https://dev.azure.com/{organization}/{project}/_apis/policy/configurations?api-version=7.1-preview.1
            Write-Output "no existing policy found - creating new"
            $urlRaw = "$devops_org_url/$devops_team_project/_apis/policy/configurations?api-version=7.1-preview.1"
            $urlRaw = [uri]::escapeuristring($urlRaw)
            $body = @{
                isBlocking = $true
                isEnabled = $true
                type = @{
                    id = "fd2167ab-b0be-447a-8ec8-39368250530e" # "Required Approvers"
                }
                settings = @{
                    scope = @(
                        @{
                            repositoryId = $repositoryId
                            refName = "refs/heads/$branchname"
                            matchKind = "exact"
                        }
                    )
                    requiredReviewerIds = $ReviewersToAdd
                    creatorVoteCounts = $false
                    filenamePatterns = [array]$pathFilterList
                    message = "Automatically added reviewers for Path:[$targetPath]"
                }
            }
            Write-Verbose "Request Body:"
            Write-Verbose "$($body | ConvertTo-Json -depth 20)"
            $result = Invoke-RestMethod -Method "POST" -Uri $urlRaw -ContentType "application/json" -Headers $header -Body ($body | ConvertTo-Json -depth 20)
        }

        {$_ -ge 2} {
            #More than one matching branch policy found
            Throw "More than one Required Reviewers policy matching the pathfilter [$pathFilter] was found for branch [$branch]. Unable to update branch policy."
        }
    }
}

Function Add-ADOPullRequestReviewer {
    <#
        .SYNOPSIS
            Adds reviewers to an Azure DevOps pull request

        .DESCRIPTION
            Execute this function to add a specified reviewer to a specified pull request. The pull request is identified my supplying the DevOps Org, Devops Project, Repository ID, and Pull Request ID.
            The reviewer being added can be either a Devops Team or User. You can also specify if the reviewer should be mandatory or optional.
            The Function provides default vaules for DevOps Org, Devops Project, Repository ID, and Pull Request ID when called from a devops pipeline.

        .EXAMPLE
            #Call from DevOps Pipeline example
            Add-ADOPullRequestReviewer -Reviewer "andrew.lambert@team.telstra.com" -isRequired $true
    #>

    [CmdletBinding()]
    param (
        # Devops Org URL eg. https://dev.azure.com/org_name - automatically populates when running from Devops Pipeline
        [String]$devops_org_url = $ENV:SYSTEM_COLLECTIONURI,

        # Devops Org URL eg. ESLZ Platform - automatically populates when running from Devops Pipeline
        [String]$devops_team_project = $ENV:SYSTEM_TEAMPROJECT,

        # Triggering repository ID eg. 51 - automatically populates when running from Devops Pipeline
        [String]$triggerRepoId = $ENV:BUILD_REPOSITORY_ID,

        # The pull request ID to target eg. 178 - automatically populates when running from Devops Pipeline
        [String]$pullRequestId = $ENV:SYSTEM_PULLREQUEST_PULLREQUESTID,

        # PAT Token to allow PR updates - automatically populates  with system_accesstoken when running from Devops Pipeline
        [Parameter()]
        [String]
        $adoPAT = $ENV:SYSTEM_ACCESSTOKEN,

        # The Name of the DevOps Team or User being added as a reviewer
        [Parameter()]
        [String]
        $Reviewer,

        # Controls whether the reviewer is mandatory or optional
        [Parameter()]
        [Boolean]
        $isRequired = $false
    )

    $devops_organisation = ($devops_org_url  -split ("/"))[3]

    #Build the Header with the PAT provided
    $user = ""
    $base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $User, $adoPAT)));
    $header = @{Authorization = ("Basic {0}" -f $base64AuthInfo) };

    $thisReviewer = Get-ADOSubjectId -devops_organisation $devops_organisation -Subject $reviewer

    # Add a reviewer
    $urlRaw = "$devops_org_url/$devops_team_project/_apis/git/repositories/$triggerRepoId/pullRequests/$pullRequestId/reviewers/$($thisReviewer.id)?api-version=6.0"
    $urlRaw = [uri]::escapeuristring($urlRaw)
    $body = @{
        isRequired = $isRequired
    }
    Write-Output "INFO: Adding reviewer [$($thisReviewer.displayName)]/ descriptor [$($thisReviewer.descriptor)] / reviewerId [$($thisReviewer.id)] as an approver to PR [$pullRequestId] in repo [$triggerRepoId]. Mandatory = [$isRequired]"

    Invoke-RestMethod -Method "PUT" -Uri $urlRaw -ContentType "application/json" -Headers $header -Body ($body | ConvertTo-Json)
}

function Get-ADOEnvironment {
    <#
        .SYNOPSIS
            Get Azure Devops Environment including its Approvals and Checks configuration

        .DESCRIPTION
            Gets the Azure DevOps environment along with its approvals and check configurations, and returns key configuration details.

            Return object:
            id = the ID of the environment - used by Set-ADOEnvironment to carry out updates.
            ensure = "Present" or "Absent" idicates to the Test-ADOEnvironment and Set-ADOEnvironment functions whether the Environment exists or not
            approversList = Returns the current list of Environment approvers
            approversList_check_id = The ID of the approvers check - used by Set-ADOEnvironment to carry out updates.
            exclusiveLock = Returns the current Exclusive Lock setting (Boolean)
            exclusiveLock_check_id = The ID of the Exclusive Lock check - used by Set-ADOEnvironment to carry out updates.
            deployBranches = Returns the current list of allowed deploy branches
            deployBranches_check_id = The ID of the Deploy Branches check - used by Set-ADOEnvironment to carry out updates.

            Use in conjunction with Test-ADOEnvironment and  Set-ADOEnvironment

        .EXAMPLE
            Get-ADOEnvironment -devops_org_url "https://dev.azure.com/ecpIncubate" -devops_team_project "ESLZ Platform" -adoPAT $adoPAT -EnvironmentName "Production"

    #>
    [CmdletBinding()]
    param (
        # Devops Org URL eg. https://dev.azure.com/org_name - automatically populates when running from Devops Pipeline
        [String]$devops_org_url = $ENV:SYSTEM_COLLECTIONURI,

        # Devops Org URL eg. ESLZ Platform - automatically populates when running from Devops Pipeline
        [String]$devops_team_project = $ENV:SYSTEM_TEAMPROJECT,

        # PAT Token to allow environment configurations - automatically populates  with system_accesstoken when running from Devops Pipeline
        [Parameter()]
        [String]
        $adoPAT = $ENV:SYSTEM_ACCESSTOKEN,

        # The Name of the ADO environment to get.
        [Parameter(Mandatory=$true)]
        [String]
        $EnvironmentName
    )

    #Build the Header with the PAT provided
    $user = ""
    $base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $User, $adoPAT)));
    $header = @{Authorization = ("Basic {0}" -f $base64AuthInfo) };

    #Because we don't know the ID of the environmnet (only the name) we need to get a list of all environments then match the name property
    #List Environments - https://docs.microsoft.com/en-us/rest/api/azure/devops/distributedtask/environments/list?view=azure-devops-rest-6.0
    $urlRaw = "$devops_org_url/$devops_team_project/_apis/distributedtask/environments?api-version=6.0-preview.1"
    $urlRaw = [uri]::escapeuristring($urlRaw)
    $environment_list = Invoke-RestMethod -Method "GET" -Uri $urlRaw -ContentType "application/json" -Headers $header -StatusCodeVariable STATUSCODE
    Write-Verbose "INFO: Status Code: [$STATUSCODE]"
    $targetEnvironment | Convertto-Json -depth 10 | Write-Verbose

    $targetEnvironment = $environment_list.value |Where-Object { $_.name -eq $EnvironmentName}
    if ($targetEnvironment){
        #Get list of configurations for existing checks
        $urlRaw = "$devops_org_url/$devops_team_project/_environments/$($targetEnvironment.id)/checks?__rt=fps&__ver=2"
        $urlRaw = [uri]::escapeuristring($urlRaw)
        $existing_checks = Invoke-RestMethod -Uri $urlRaw -Headers $header -Method Get -ContentType application/json
        $existing_checks = $existing_checks.fps.dataProviders.data.'ms.vss-pipelinechecks.checks-data-provider'.checkConfigurationDataList
        $existing_checks |Convertto-Json -depth 10 | Write-Verbose

        $exclusiveLock = $existing_checks | Where-Object { $_.checkConfiguration.type.name -eq "ExclusiveLock" }
        $exclusiveLock_check_id = $exclusiveLock.checkConfiguration.id
        $exclusiveLock = $exclusiveLock ? $true : $false

        $deployBranches = $existing_checks | Where-Object { $_.checkConfiguration.type.name -eq "Task Check" -and $_.checkConfiguration.settings.definitionRef.name -eq "evaluateBranchProtection" }
        $deployBranches_check_id = $deployBranches.checkConfiguration.id
        $deployBranches = $deployBranches.checkConfiguration.settings.inputs.allowedBranches

        $approvers = $existing_checks | Where-Object { $_.checkConfiguration.type.name -eq "Approval" }
        $approvers_check_id = $approvers.checkConfiguration.id
        $approvers = $approvers.checkConfiguration.settings.approvers
        $approvers = $approvers.uniqueName -join ","
    }

    $ensure = $targetEnvironment.Count -gt 0 ? "Present" : "Absent"

    return @{
        id = $targetEnvironment.id
        ensure = $ensure
        approversList = $approvers
        approversList_check_id = $approvers_check_id
        exclusiveLock = [boolean]$exclusiveLock
        exclusiveLock_check_id = $exclusiveLock_check_id
        deployBranches = $deployBranches
        deployBranches_check_id = $deployBranches_check_id
    }

}

Function Test-ADOEnvironment {
    <#
        .SYNOPSIS
            Get Azure Devops Environment including its Approvals and Checks configuration and checks to see if its current configuration matches a desired configuration.

        .DESCRIPTION
            Gets the Azure DevOps environment along with its approvals and check configurations, and checks to see if the following properties match the desired configuration:
            Ensure - specify if the environment is desired to exist (Present), or be deleted (Absent)
            ApproversList - specify the desired list of Environment Approvers
            ExclusiveLock - specify the desired setting for ExclusiveLock
            DeployBranches - specify the desired list of allowed Deploy branches

            Used by Set-ADOEnvironment to determine if changes are required.

        .EXAMPLE
            Test-ADOEnvironment -devops_org_url "https://dev.azure.com/ecpIncubate" -devops_team_project "ESLZ Platform" -adoPAT $adoPAT -EnvironmentName "Production"

    #>
    [CmdletBinding()]
    param (
        # Devops Org URL eg. https://dev.azure.com/org_name - automatically populates when running from Devops Pipeline
        [String]$devops_org_url = $ENV:SYSTEM_COLLECTIONURI,

        # Devops Org URL eg. ESLZ Platform - automatically populates when running from Devops Pipeline
        [String]$devops_team_project = $ENV:SYSTEM_TEAMPROJECT,

        # PAT Token to allow environment configurations - automatically populates  with system_accesstoken when running from Devops Pipeline
        [Parameter()]
        [String]
        $adoPAT = $ENV:SYSTEM_ACCESSTOKEN,

        # The Name of the environment.
        [Parameter(Mandatory=$true)]
        [String]
        $EnvironmentName,

        # Array of approvers to assign to the environment. Array can include users or groups.
        [Parameter(Mandatory=$true)]
        [AllowEmptyCollection()]
        [Array]
        $ApproversList,

        # Enabling this setting makes it so that only one deployment can run against the Environment at a time
        [Parameter()]
        [Boolean]
        $ExclusiveLock = $true,

        # Sets which branches are allowed to deploy to this Environment
        [Parameter(Mandatory=$true)]
        [AllowEmptyCollection()]
        [Array]
        $DeployBranches,

        [Parameter()]
        [ValidateSet("Present", "Absent")]
        [string]
        $ensure = "Present" #Configurable Property

    )

    $testPass = $true

    # Get The current Configuration
    $currentState = Get-ADOEnvironment -EnvironmentName $EnvironmentName -devops_org_url $devops_org_url -devops_team_project $devops_team_project -adoPAT $adoPAT
    $configurableProperties = @("ensure","ApproversList","ExclusiveLock","DeployBranches")
    $DeployBranches = $DeployBranches -join ","
    $ApproversList = $ApproversList -join ","

    # Check Desired Values against current state
    ForEach ($property in $configurableProperties) {
        $desiredValue = Get-Variable -Name $property -Value -ErrorAction SilentlyContinue
        Write-Verbose "property [$property] : current value [$($currentState.$property)] desired value [$desiredValue]"
        if ($currentState.$property -ne $desiredValue -and $null -ne $desiredValue){
            $message = "property [$property] : current value [$($currentState.$property)] does not match the desired value [$desiredValue]"
            Write-Verbose $message
            $testPass = $false
            [array]$messages += $message
        }
    }

    # Other service checks can be added as needed

    #Print out helpful messages - include a heading and remediation instructions
    $heading = "ADO Environment - ESLZ Stage"
    $remediation = "To fix ADO Environment issues, pipeline audit logs"

    if ($testPass -eq $false){
        [array]$return_messages += "##vso[task.logissue type=error] Prereq Check failed: $heading"
        $return_messages += $messages | ForEach-Object { "##[Error] $_" }
        $return_messages +="##[Error] $remediation"
     } else {
         [array]$return_messages +="Prereq Check passed: $heading"
     }


    Return @{
        testPass        = $testPass
        currentState    = $currentState
        messages        = $return_messages
    }
}

function Set-ADOEnvironment {
    <#
        .SYNOPSIS
            Creates Azure Devops Environment and sets Approvals and Checks

        .DESCRIPTION
            Creates the environmnet if it does not exist. Sets the following environment checks:
            Ensure - specify if the environment is desired to exist (Present), or be deleted (Absent)
            ApproversList - specify the desired list of Environment Approvers
            ExclusiveLock - specify the desired setting for ExclusiveLock
            DeployBranches - specify the desired list of allowed Deploy branches

        .EXAMPLE
            Set-ADOEnvironment -EnvironmentName "Production" -ApproversList @("Joe Blogs", "CPS Team") -ExclusiveLock $true -DeployBranches @("refs/heads/main","refs/heads/feature/*")

    #>
    [CmdletBinding()]
    param (
        # Devops Org URL eg. https://dev.azure.com/org_name - automatically populates when running from Devops Pipeline
        [String]$devops_org_url = $ENV:SYSTEM_COLLECTIONURI,

        # Devops Org URL eg. ESLZ Platform - automatically populates when running from Devops Pipeline
        [String]$devops_team_project = $ENV:SYSTEM_TEAMPROJECT,

        # PAT Token to allow environment configurations - automatically populates  with system_accesstoken when running from Devops Pipeline
        [Parameter()]
        [String]
        $adoPAT = $ENV:SYSTEM_ACCESSTOKEN,

        # The Name of the environment. If it does not exist, environment will be created.
        [Parameter(Mandatory=$true)]
        [String]
        $EnvironmentName,

        # Array of approvers to assign to the environment. Array can include users or groups.
        [Parameter(Mandatory=$true)]
        [AllowEmptyCollection()]
        [Array]
        $ApproversList,

        # Enabling this setting makes it so that only one deployment can run against the Environment at a time
        [Parameter()]
        [Boolean]
        $ExclusiveLock = $true,

        # Sets which branches are allowed to deploy to this Environment
        [Parameter(Mandatory=$true)]
        [AllowEmptyCollection()]
        [Array]
        $DeployBranches,

        [String]
        $securityNamespaceId = '83d4c2e6-e57d-4d6e-892b-b87222b7ad20',

        # Specify whether the environment should exist or not. This controls environment creation/deletion.
        [Parameter()]
        [ValidateSet("Present", "Absent")]
        [string]
        $ensure = "Present"
    )

    # Get + Test The current Configuration
    $result = Test-ADOEnvironment @PSBoundParameters
    $currentState = $result.currentState

    #Build the Header with the PAT provided
    $user = ""
    $base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $User, $adoPAT)));
    $header = @{Authorization = ("Basic {0}" -f $base64AuthInfo) };

    if ($result.testPass -ne $true){

        if ($currentState.ensure -ne $ensure -and $ensure -eq "Present") {
            Write-Output "INFO: Creating new environment [$environmentName]"
            #Create New Environment https://docs.microsoft.com/en-us/rest/api/azure/devops/distributedtask/environments/add?view=azure-devops-rest-6.0
            $urlRaw = "$devops_org_url/$devops_team_project/_apis/distributedtask/environments?api-version=6.0-preview.1"
            $urlRaw = [uri]::escapeuristring($urlRaw)
            $body = @{
                "name"        = "$environmentName"
                "description" = "ESLZ $environmentName"
            }
            $environment = Invoke-RestMethod -Method "POST" -Uri $urlRaw -ContentType "application/json" -Headers $header -Body ($body | ConvertTo-Json)
            $environment | ConvertTo-Json -depth 20 | Write-Verbose
            $thisEnv = $environment.value | Where-Object {$_.Name -eq "$EnvironmentName"}

            #Add NEW Branch Check
            Set-EnvironmentCheckBranchControl -devops_org_url $devops_org_url -devops_team_project $devops_team_project -adoPAT $adoPAT -EnvironmentName $thisEnv.Name -EnvironmentId $thisEnv.id -DeployBranches $DeployBranches
            #Add NEW Exclusive lock Check
            Set-EnvironmentCheckExclusiveLock -devops_org_url $devops_org_url -devops_team_project $devops_team_project -adoPAT $adoPAT -EnvironmentName $thisEnv.Name -EnvironmentId $thisEnv.id -ExclusiveLock $ExclusiveLock
            #Add NEW Approvers Check
            Set-EnvironmentCheckApprovers -devops_org_url $devops_org_url -devops_team_project $devops_team_project -adoPAT $adoPAT -EnvironmentName $thisEnv.Name -EnvironmentId $thisEnv.id -ApproversList $ApproversList
        }

        if ($currentState.ensure -eq $ensure -and $ensure -eq "Present") {
            Write-Output "INFO: Update existing Environment [$environmentName]"
            # Get existing env https://docs.microsoft.com/en-us/rest/api/azure/devops/distributedtask/environments/get?view=azure-devops-rest-6.0
            $urlRaw = "$devops_org_url/$devops_team_project/_apis/distributedtask/environments/$($currentState.id)?api-version=6.0-preview.1"
            $urlRaw = [uri]::escapeuristring($urlRaw)
            $environment = Invoke-RestMethod -Method "GET" -Uri $urlRaw -ContentType "application/json" -Headers $header
            $environment | ConvertTo-Json -depth 20 | Write-Verbose

            # Update Existing Branch Check
            Set-EnvironmentCheckBranchControl -devops_org_url $devops_org_url -devops_team_project $devops_team_project -adoPAT $adoPAT -EnvironmentName $environment.Name -EnvironmentId $environment.id -DeployBranches $DeployBranches
            # Update Existing Exclusive lock Check
            Set-EnvironmentCheckExclusiveLock -devops_org_url $devops_org_url -devops_team_project $devops_team_project -adoPAT $adoPAT -EnvironmentName $environment.Name -EnvironmentId $environment.id -ExclusiveLock $ExclusiveLock
            # Update Existing Approvers Check
            Set-EnvironmentCheckApprovers -devops_org_url $devops_org_url -devops_team_project $devops_team_project -adoPAT $adoPAT -EnvironmentName $environment.Name -EnvironmentId $environment.id -ApproversList $ApproversList
        }
    } else {
        Write-Verbose "Current Config equals Desired Config, nothing to do..."
    }
}

Function Set-EnvironmentCheckApprovers {
     <#
        .SYNOPSIS
            Sets the Approvers check on an environment

        .DESCRIPTION
            Sets the Approvers check on an environment

        .EXAMPLE
            Set-EnvironmentCheckApprovers -EnvironmentName "Production" -EnvironmentID 123 -ApproversList @("Joe Blogs", "TCG Team")

    #>
    [CmdletBinding()]
    param (
        # Devops Org URL eg. https://dev.azure.com/org_name - automatically populates when running from Devops Pipeline
        [String]$devops_org_url = $ENV:SYSTEM_COLLECTIONURI,

        # Devops Org URL eg. ESLZ Platform - automatically populates when running from Devops Pipeline
        [String]$devops_team_project = $ENV:SYSTEM_TEAMPROJECT,

        # PAT Token to allow environment configurations - automatically populates  with system_accesstoken when running from Devops Pipeline
        [Parameter()]
        [String]
        $adoPAT = $ENV:SYSTEM_ACCESSTOKEN,

        # The Name of the environment.
        [Parameter(Mandatory=$true)]
        [String]
        $EnvironmentName,

        # The ID of the environment.
        [Parameter(Mandatory=$true)]
        $EnvironmentId,

        # Array of approvers to assign to the environment. Array can include users or groups.
        [Parameter(Mandatory=$true)]
        [AllowEmptyCollection()]
        [Array]
        $ApproversList
    )
    $devops_organisation = ($devops_org_url  -split ("/"))[3]

    #Build the Header with the PAT provided
    $user = ""
    $base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $User, $adoPAT)));
    $header = @{Authorization = ("Basic {0}" -f $base64AuthInfo) };

    $urlRaw = "$devops_org_url/$devops_team_project/_environments/$($EnvironmentId)/checks?__rt=fps&__ver=2"
    $urlRaw = [uri]::escapeuristring($urlRaw)
    $existing_checks = Invoke-RestMethod -Uri $urlRaw -Headers $header -Method Get -ContentType application/json
    $existing_checks = $existing_checks.fps.dataProviders.data.'ms.vss-pipelinechecks.checks-data-provider'.checkConfigurationDataList

    $existing_approvers =  @()
    foreach ($item in ($existing_checks | Where-Object {$_.checkConfiguration.type.name -eq "approval"} )){
        $existing_approvers += @{
            "approver_name" = $item.checkConfiguration.settings.approvers.uniqueName
            "check_id" = $item.checkConfiguration.id
        }
    }

    # Add/Update Approvals
    # if $appovers_list is not in list of $existing_approvals then add new
    foreach ($approver in $ApproversList) {
        if ($existing_approvers.approver_name -notcontains $approver) {
            Write-Output "INFO: Adding approver [$approver]"
            #Subject lookup
            $urlRaw = "https://vssps.dev.azure.com/$devops_organisation/_apis/graph/subjectquery?api-version=6.0-preview.1"
            $urlRaw = [uri]::escapeuristring($urlRaw)
            $body = @{
                query = $approver
                subjectKind = @("Group","User")
            }
            $lookupResult = Invoke-RestMethod -Method "POST" -Uri $urlRaw -ContentType "application/json" -Headers $header -Body ($body | ConvertTo-Json)

            if ($lookupResult.value.descriptor.count -gt 1){
                Throw "ERROR: The value supplied for \$approver returned more than one match. Try using a more decriptive name."
            }

            #Find correct subject ID
            $descriptor = $lookupResult.value.descriptor
            $urlRaw = "https://vssps.dev.azure.com/$devops_organisation/_apis/identities?subjectDescriptors=$($descriptor)&queryMembership=None&api-version=6.0"
            $urlRaw = [uri]::escapeuristring($urlRaw)
            $result = Invoke-RestMethod -Method "GET" -Uri $urlRaw -ContentType "application/json" -Headers $header
            $approver_id = $result.value.id

            #Add approver to environment - https://docs.microsoft.com/en-us/rest/api/azure/devops/approvalsandchecks/check-configurations/add?view=azure-devops-rest-6.1
            $urlRaw = "$devops_org_url/$devops_team_project/_apis/pipelines/checks/configurations?api-version=6.1-preview.1"
            $urlRaw = [uri]::escapeuristring($urlRaw)
            $body = @{
                type     = @{
                    id   = "8C6F20A7-A545-4486-9777-F762FAFE0D4D";
                    name = "Approval";
                };
                settings = @{
                    approvers                 = @(
                        @{
                            id         = "$approver_id";
                            uniqueName = "$approver";
                        };
                    );
                    executionOrder            = "anyOrder";
                    instructions              = "- Check the output from Terraform Plan Stage `n- Ensure Previous Stages have run successfully  and passed all tests";
                    blockedApprovers          = @();
                    minRequiredApprovers      = 1;
                    requesterCannotBeApprover = $true;
                };
                resource = @{
                    type = "environment";
                    id   = $environmentid;
                    name = $environmentName;
                };
                timeout  = 5760
            }
            $new_approver = Invoke-RestMethod -Method "POST" -Uri $urlRaw -ContentType "application/json" -Headers $header -Body ($body | ConvertTo-Json -Depth 20)
            $new_approver | Write-Verbose
        }
    }

    # if $existing_approver is not in $ApproversList then remove it
    foreach ($item in $existing_approvers) {
        if ($ApproversList -notcontains $item.approver_name) {
            Write-Output "INFO: Removing approver [$($item.approver_name)]"
            $urlRaw = "$devops_org_url/$devops_team_project/_apis/pipelines/checks/configurations/$($item.check_id)?api-version=6.1-preview.1"
            $urlRaw = [uri]::escapeuristring($urlRaw)
            $remove_approver = Invoke-RestMethod -Method "DELETE" -Uri $urlRaw -ContentType "application/json" -Headers $header
            $remove_approver | write-verbose
        }
    }
    Write-Output "INFO: Completed Set-EnvironmentCheckApprovers"
}

Function Set-EnvironmentCheckBranchControl {
    <#
        .SYNOPSIS
            Sets the Branch Control check on an environment

        .DESCRIPTION
            Sets the Branch Control check on an environment

        .EXAMPLE
            Set-EnvironmentCheckBranchControl -EnvironmentName "Production" -EnvironmentID 123 -DeployBranches @("refs/heads/main","refs/heads/feature/*")

    #>
    [CmdletBinding()]
    param (
        # Devops Org URL eg. https://dev.azure.com/org_name - automatically populates when running from Devops Pipeline
        [String]$devops_org_url = $ENV:SYSTEM_COLLECTIONURI,

        # Devops Org URL eg. ESLZ Platform - automatically populates when running from Devops Pipeline
        [String]$devops_team_project = $ENV:SYSTEM_TEAMPROJECT,

        # PAT Token to allow environment configurations - automatically populates  with system_accesstoken when running from Devops Pipeline
        [Parameter()]
        [String]
        $adoPAT = $ENV:SYSTEM_ACCESSTOKEN,

        # The Name of the environment.
        [Parameter(Mandatory=$true)]
        [String]
        $EnvironmentName,

        # The ID of the environment.
        [Parameter(Mandatory=$true)]
        $EnvironmentId,

        # The branches that are allowed to deploy to this environment. Each branch name must begin with refs/heads
        [Parameter(Mandatory=$true)]
        [Array]
        $DeployBranches
    )

    ####Branch Control
    [string]$DeployBranches = $DeployBranches -join (",")

    #Build the Header with the PAT provided
    $user = ""
    $base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $User, $adoPAT)));
    $header = @{Authorization = ("Basic {0}" -f $base64AuthInfo) };

    $urlRaw = "$devops_org_url/$devops_team_project/_environments/$($EnvironmentId)/checks?__rt=fps&__ver=2"
    $urlRaw = [uri]::escapeuristring($urlRaw)
    $existing_checks = Invoke-RestMethod -Uri $urlRaw -Headers $header -Method Get -ContentType application/json
    $existing_checks = $existing_checks.fps.dataProviders.data.'ms.vss-pipelinechecks.checks-data-provider'.checkConfigurationDataList

    $existing_branch_control = $existing_checks | Where-Object {$_.checkConfiguration.type.name -eq "Task Check" -and $_.checkConfiguration.settings.displayName -eq "Branch Control"}

    $body = @{
        type     = @{
            id   = "FE1DE3EE-A436-41B4-BB20-F6EB4CB879A7";
            name = "Task Check";
        };
        settings = @{
            displayName = "Branch Control";
            definitionRef = @{
                id = "86b05a0c-73e6-4f7d-b3cf-e38f3b39a75b";
                name = "evaluatebranchProtection";
                version = "0.0.1"
            };
            inputs = @{
                allowedBranches = $DeployBranches;
                ensureProtectionOfBranch = $false
            }
            retryInterval = 5
        };
        resource = @{
            type = "environment";
            id   = $environmentId;
            name = $environmentName;
        };
        timeout  = 240
    }

    if ($existing_branch_control.count -gt 0){
        if ($DeployBranches -eq ""){
            # Delete Branch control
            Write-Output "INFO: Removing Branch control"
            $urlRaw = "$devops_org_url/$devops_team_project/_apis/pipelines/checks/configurations/$($existing_branch_control.checkconfiguration.id)?api-version=6.1-preview.1"
            $urlRaw = [uri]::escapeuristring($urlRaw)
            $remove_branch_control = Invoke-RestMethod -Method "DELETE" -Uri $urlRaw -ContentType "application/json" -Headers $header
            $remove_branch_control | write-verbose
        } else {
            #update existing
            Write-Output "INFO: Updating Branch control"
            $urlRaw = "$devops_org_url/$devops_team_project/_apis/pipelines/checks/configurations/$($existing_branch_control.checkconfiguration.id)?api-version=6.1-preview.1"
            $urlRaw = [uri]::escapeuristring($urlRaw)
            $update_branch_control = Invoke-RestMethod -Method "PATCH" -Uri $urlRaw -ContentType "application/json" -Headers $header -Body ($body | ConvertTo-Json -Depth 20)
            $update_branch_control | write-verbose
        }

    } else {
        if ($DeployBranches -ne ""){
            #create new
            Write-Output "INFO: Adding Branch control"
            $urlRaw = "$devops_org_url/$devops_team_project/_apis/pipelines/checks/configurations?api-version=6.1-preview.1"
            $urlRaw = [uri]::escapeuristring($urlRaw)
            $new_branch_control = Invoke-RestMethod -Method "POST" -Uri $urlRaw -ContentType "application/json" -Headers $header -Body ($body | ConvertTo-Json -Depth 20)
            $new_branch_control | write-verbose
        }
    }
    Write-Output "INFO: Completed Set-EnvironmentCheckBranchControl"
}

Function Set-EnvironmentCheckExclusiveLock {
    <#
        .SYNOPSIS
            Sets the Exclusive Lock check on an environment

        .DESCRIPTION
            Sets the Exclusive Lock check on an environment. Exclusive Lock allows only 1 active delpoyment to an environment at a time.

        .EXAMPLE
            Set-EnvironmentCheckBranchControl -EnvironmentName "Production" -EnvironmentID 123 -DeployBranches @("refs/heads/main","refs/heads/feature/*")

    #>
    [CmdletBinding()]
    param (
        # Devops Org URL eg. https://dev.azure.com/org_name - automatically populates when running from Devops Pipeline
        [String]$devops_org_url = $ENV:SYSTEM_COLLECTIONURI,

        # Devops Org URL eg. ESLZ Platform - automatically populates when running from Devops Pipeline
        [String]$devops_team_project = $ENV:SYSTEM_TEAMPROJECT,

        # PAT Token to allow environment configurations - automatically populates  with system_accesstoken when running from Devops Pipeline
        [Parameter()]
        [String]
        $adoPAT = $ENV:SYSTEM_ACCESSTOKEN,

        # The Name of the environment.
        [Parameter(Mandatory=$true)]
        [String]
        $EnvironmentName,

        # The ID of the environment.
        [Parameter(Mandatory=$true)]
        $EnvironmentId,

        [boolean]$ExclusiveLock = $true
    )

    #Build the Header with the PAT provided
    $user = ""
    $base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $User, $adoPAT)));
    $header = @{Authorization = ("Basic {0}" -f $base64AuthInfo) };

    $urlRaw = "$devops_org_url/$devops_team_project/_environments/$($EnvironmentId)/checks?__rt=fps&__ver=2"
    $urlRaw = [uri]::escapeuristring($urlRaw)
    $existing_checks = Invoke-RestMethod -Uri $urlRaw -Headers $header -Method Get -ContentType application/json
    $existing_checks = $existing_checks.fps.dataProviders.data.'ms.vss-pipelinechecks.checks-data-provider'.checkConfigurationDataList

    $existing_exclusive_lock = $existing_checks | Where-Object {$_.checkConfiguration.type.name -eq "ExclusiveLock"}

    if ($ExclusiveLock -eq $true) {
        if ($existing_exclusive_lock.count -eq 0){
            Write-Output "Adding Exclusive Lock"
            #create exclusive lock
            $urlRaw = "$devops_org_url/$devops_team_project/_apis/pipelines/checks/configurations?api-version=6.1-preview.1"
            $urlRaw = [uri]::escapeuristring($urlRaw)
            $body = @{
                type     = @{
                    id   = "2EF31AD6-BAA0-403A-8B45-2CBC9B4E5563";
                    name = "ExclusiveLock";
                };
                resource = @{
                    type = "environment";
                    id   = $environmentid;
                    name = $environmentName;
                };
                timeout  = 1440
            }
            $new_exclusive_lock = Invoke-RestMethod -Method "POST" -Uri $urlRaw -ContentType "application/json" -Headers $header -Body ($body | ConvertTo-Json -Depth 20)
            $new_exclusive_lock | write-verbose
        }
    } else {
        if ($existing_exclusive_lock.count -gt 0){
            #remove exclusive lock
            Write-Output "Removing Exclusive Lock"
            $urlRaw = "$devops_org_url/$devops_team_project/_apis/pipelines/checks/configurations/$($existing_exclusive_lock.checkconfiguration.id)?api-version=6.1-preview.1"
            $urlRaw = [uri]::escapeuristring($urlRaw)
            $remove_exclusive_lock = Invoke-RestMethod -Method "DELETE" -Uri $urlRaw -ContentType "application/json" -Headers $header
            $remove_exclusive_lock | write-verbose
        }

    }
    Write-Output "INFO: Completed Set-EnvironmentCheckExclusiveLock"
}

Function Invoke-TfDocs {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseSingularNouns", "")]
    <#
        .SYNOPSIS
            Run terraform-docs to generate README.md

        .DESCRIPTION
            Download and run terraform-docs to generate README.md

        .EXAMPLE
            PS> cd <path_to_Terraform_code>
            PS> Invoke-TfDocs -os Windows
    #>

    [CmdletBinding()]
    param (
        [Parameter()]
        # Temp directory for terraform-docs binary (default $ENV:AGENT_TEMPDIRECTORY)
        [String] $tempDirectory=$ENV:AGENT_TEMPDIRECTORY,
        # Operating system (default $ENV:AGENT_OS)
        [String] $os=$ENV:AGENT_OS,
        [string] $outputType="markdown"
    )

    if ($null -ne $ENV:PIPELINE_WORKSPACE){
        Write-Verbose "INFO: Detected running inside pipeline"
        $tempDirectory=$ENV:AGENT_TEMPDIRECTORY
        $os=$ENV:AGENT_OS
    }

    $tfDocsCommand = (Get-Command "terraform-docs" -ErrorAction SilentlyContinue).Path
    if ($null -eq $tfDocsCommand) {
        Write-Verbose "Install documentation tools"
        if ($os -match "Windows"){
            if (!(Test-Path "$tempDirectory/terraform-docs.exe")) {
                Invoke-Webrequest -uri "https://github.com/terraform-docs/terraform-docs/releases/download/v0.15.0/terraform-docs-v0.15.0-windows-amd64.zip" -outfile "$tempDirectory/terraform-docs.zip"
                Expand-Archive "$tempDirectory/terraform-docs.zip" "$tempDirectory" -Force | Write-Verbose
            }
        } else {
            if (!(Test-Path "$tempDirectory/terraform-docs")) {
                Invoke-Webrequest -uri "https://github.com/terraform-docs/terraform-docs/releases/download/v0.15.0/terraform-docs-v0.15.0-linux-amd64.tar.gz" -outfile "$tempDirectory/terraform-docs.tar.gz"
                tar -xzvf "$tempDirectory/terraform-docs.tar.gz" -C "$tempDirectory" | Write-Verbose
                sudo install -c -v "$tempDirectory/terraform-docs" "/usr/local/bin" | Write-Verbose
            }
        }
        $tfDocsCommand = "$tempDirectory/terraform-docs"

    }

    Write-Verbose "Generate documentation [$outputType]!"
    if ($outputType -eq "markdown"){
        & $tfDocsCommand markdown table . --output-file README.md
    }
    if ($outputType -eq "json"){
        # $json = Invoke-Command -Command $($tfDocsCommand.Source) -ArgumentList "json ."
        # $parameters = @{
        #     ScriptBlock = { & $($tfDocsCommand.Source) json . }
        # }
        # $json = Invoke-Command @parameters
        # Return $json
        # Write-Verbose "& method"
        # & terraform-docs json .

        & $tfDocsCommand json .
    }

}

Export-ModuleMember -Function "*"