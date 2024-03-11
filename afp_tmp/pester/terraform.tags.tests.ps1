# param (
#     [Parameter()]
#     # Working directory for Terraform configuration
#     [String] $pwd=$pwd
# )

Describe "Defined Tags" {

    Context "Terraform Variable Object - Mandatory Tags" -Tag "platform","governance" {
        # Mandatory Tags
        # $mandatory_tags = @{
        #     "applicationid" = "string"
        #     "environmentclass" = "string"
        #     "environmentuse" = "string"
        #     "internetfacing" = "bool"
        #     "platform" = "string"
        #     "version" = "string"
        #     "dataclassification" = "string"
        #     "dataclassificationsubtype" = "string"
        #     "dataregion" = "string"
        #     "costcentre" = "string"
        #     "app_contact" = "string"
        # }

        $folderPath = Join-Path $pwd "config" # replace with your folder path
        if (Test-Path $folderPath) {
        # Context "Tag Keys" {

            $global_variable_filenames = Get-ChildItem -Path (Join-Path $pwd "config") -Filter "*global.json" -File | ForEach-Object Name

            It "Has mandatory tag key pairs defined in the global configuration for [<_>.json]" -ForEach $global_variable_filenames {


                $mandatory_tags = @{
                    "applicationid" = "string"
                    "environmentclass" = "string"
                    "environmentuse" = "string"
                    "internetfacing" = "bool"
                    "platform" = "string"
                    "version" = "string"
                    "dataclassification" = "string"
                    "dataclassificationsubtype" = "string"
                    "dataregion" = "string"
                    "costcentre" = "string"
                    "app_contact" = "string"
                }

                    $taglist = (Get-Content (Join-Path $pwd "config" "$($_)") | ConvertFrom-Json).input_parameters
                    $list = $taglist.tags.psObject.members.where{$_.MemberType -eq "NoteProperty"}
                    $declared_tags = @{}
                    foreach ($item in $list)
                        {
                            $declared_tags.Add($item.Name, $item.Value)
                        }
                    $compare = compare-Object @($mandatory_tags.Keys) @($declared_tags.Keys) -IncludeEqual

            
                    foreach ($item in $compare) {
                        $item.SideIndicator | Should -Not -Be "<=" -Because "at a minimum all mandatory tags must be defined in global environment parameter file, mandatory tag key [$($item.InputObject)] is missing, check [$($_)] parameter file"
                    }


            # }
    
        # Naming convention of stage specific files?

        }
        } else {
            Write-Host "Folder does not exist."
        }


    }
}










# $mandatory_tags = @{
#     "applicationid" = "string"
#     "environmentclass" = "string"
#     "environmentuse" = "string"
#     "internetfacing" = "bool"
#     "platform" = "string"
#     "version" = "string"
#     "dataclassification" = "string"
#     "dataclassificationsubtype" = "string"
#     "dataregion" = "string"
#     "costcentre" = "string"
#     "app_contact" = "string"
# }


# # $declared_tags = @()

# $global_variable_filenames = Get-ChildItem -Path (Join-Path $PSScriptRoot "config") -Filter "*global.json" -File | ForEach-Object Name

# ForEach ($filename in $global_variable_filenames) {
#     $taglist = (Get-Content (Join-Path $PSScriptRoot "config" $global_variable_filenames[1]) | ConvertFrom-Json).input_parameters
#     $list = $taglist.tags.psObject.members.where{$_.MemberType -eq "NoteProperty"}
#     $declared_tags = @{}
#     foreach ($item in $list)
#         {
#             $declared_tags.Add($item.Name, $item.Value)
#         }
#     $compare = compare-Object @($mandatory_tags.Keys) @($declared_tags.Keys) -IncludeEqual -ExcludeDifferent
# }





# $global_variable_filenames = Get-ChildItem -Path (Join-Path $pwd "config") -Filter "*global.json" -File | ForEach-Object Name

# ForEach ($filename in $global_variable_filenames) {
#     $taglist = (Get-Content (Join-Path $pwd "config" $global_variable_filenames[1]) | ConvertFrom-Json).input_parameters
#     $list = $taglist.tags.psObject.members.where{$_.MemberType -eq "NoteProperty"}
#     $declared_tags = @{}
#     foreach ($item in $list)
#         {
#             $declared_tags.Add($item.Name, $item.Value)
#         }
#     $compare = compare-Object -ReferenceObject @($mandatory_tags.Keys) -DifferenceObject @($declared_tags.Keys) -IncludeEqual -ExcludeDifferent
# }








