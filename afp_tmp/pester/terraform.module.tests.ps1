Describe "Terraform Module" -Tag "tfModule" {

    BeforeAll {
        # Determine current branch (different approach for pipeline executions vs local executions)
        # Detect Diff - used for changelog detection during module validation
        $pipeline_src_branch = $ENV:BUILD_SOURCEBRANCH
        $main_branch = "refs/heads/main"
        if ($ENV:BUILD_SOURCEBRANCH) {
            $current_branch = $ENV:BUILD_SOURCEBRANCH -replace ("refs/heads", "remotes/origin") -replace ("refs/", "")
            $main_branch = $main_branch -replace ("refs/heads", "remotes/origin")

        } else {
            $current_branch = git branch --show-current
            $main_branch = $main_branch
        }	
        Write-Host "Current Branch: $current_branch"
        Write-Host "Main Branch: $main_branch"
        $check_diff = Invoke-Expression "git diff $main_branch..$current_branch"
        if ($check_diff) { 
            $diff =@{
                current_branch =$current_branch; 
                main_branch = $main_branch
            } 
            Write-Host "Diff detected: [$main_branch]..[$current_branch]"
        }
    }
		
    Context "Folder structure" {
        It "Has required file [<_>]" -ForEach @(
            "pipelines/pipeline.yaml"
            "docs/service_design.md"
            ".terraform-docs.yml"
            ".gitignore"
            "CHANGELOG.md"
        ) {
            $_ | Should -Exist -Because "this file is required to ensure usability of the module"
        }

    }

    Context "Terraform Code" {
        It "does not contain a provider block" {
            (get-content *.tf | Where-Object {$_ -match "^provider"}).Count | Should -BeLessOrEqual 0 -Because "including provider blocks in modules will cause errors when the module is called"
        }
    }

    Context "Unit Tests" {
        It "Has at least one unit test" {
            (Get-ChildItem .\tests\ -Directory -Exclude example).Count | Should -BeGreaterThan 0 -Because "unit testing is the a critical means of module validation, and is essential for maintaining quality modules"
        }

    }

    Context "Pipeline Code" {		
        It "pipelines/pipeline.yaml does not contain known syntax error for unit test toggle" {
            "pipelines/pipeline.yaml" | Should -Not -FileContentMatch "\`${{ eq\(parameters.enableUnitTests, false\) }}:" -Because "this is a syntax error. Update code to: `${{ eq('`${{parameters.enableUnitTests}}', 'false') }}:"
        }
    }

    Context "Documentation" {
        It ".terraform-docs.yml contains [<_>]" -ForEach @(
            "{{ include `"tests/"
            "{{ include `"docs/service_design.md`" }}"
            "{{ include `"CHANGELOG.md`" }}"

        ) {
            ".terraform-docs.yml" | Should -FileContentMatch $_ -Because "this string needs to be in the .terraform-docs.yml to ensure auto generated documentation contains all necessary information"
        }

#         It "CHANGELOG.md has been updated if changes are detected between branch [<main_branch>] and [<current_branch>]" -ForEach $diff {
#             $changelog_diff = Invoke-Expression "git diff $main_branch..$current_branch -- CHANGELOG.md"
#             $changelog_diff | Should -Not -BeNullOrEmpty -Because @"
#             any changes must be noted in the change log. Example markdown:
#             # CHANGELOG

#             ## 1.0.2 - 2022/02/09 12:22

#             - A minor change

#             ## 1.0.1 - 2022/02/08 16:52

#             - Testing out a change log format
#             - This change is serious **[BREAKING CHANGE]** 

# "@
#         }

        $current_branch = git branch --show-current
        If ($ENV:BUILD_SOURCEBRANCHNAME -ne "main" -and $null -ne $ENV:BUILD_SOURCEBRANCH) {
            if ($ENV:BUILD_REASON -ne "IndividualCI" -or $ENV:BUILD_REASON -ne "BatchedCI") {

                It "CHANGELOG.md must be updated to describe module changes detected between branch [<main_branch>]" {
                    $version_diff = invoke-expression "git diff remotes/origin/main:CHANGELOG.md CHANGELOG.md"
                    $version_diff | Should -Not -BeNullOrEmpty -Because "Changelog must be updated"
                }
        
                It "version.tf must be updated to reflect latest semantic version number based on changes detected between branch [<main_branch>]" {
                    $version_diff = invoke-expression "git diff remotes/origin/main:version.tf version.tf"
                    $version_diff | Should -Not -BeNullOrEmpty -Because "semantic versioning must be updated"
                }
            }

        }

        If ($current_branch -notcontains "main" -and $null -eq $ENV:BUILD_SOURCEBRANCH) {
            It "CHANGELOG.md must be updated to describe module changes detected between branch [<main_branch>]" {
                $version_diff = invoke-expression "git diff main:CHANGELOG.md CHANGELOG.md"
                $version_diff | Should -Not -BeNullOrEmpty -Because "Changelog must be updated"
            }
    
            It "version.tf must be updated to reflect latest semantic version number based on changes detected between branch [<main_branch>]" {
                $version_diff = invoke-expression "git diff main:version.tf version.tf"
                $version_diff | Should -Not -BeNullOrEmpty -Because "semantic versioning must be updated"
            }
        }

    }

    Context ".gitignore" {
        It ".gitignore contains [<_>]" -ForEach @(
            "^\*\*/.terraform/\*"
            "^\*\*/.TFTesting/\*"
            "^\*.tfplan"
            "^\*.tfvars"
        ) {
            ".gitignore" | Should -FileContentMatch $_ -Because "this file can contain user specific or sensitive data"
        }

    }

}