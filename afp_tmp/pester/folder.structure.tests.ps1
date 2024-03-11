Describe "Folder Structure" {

    Context "json" -Tag "platform","governance" {
        It "Has required file [<_>]" -ForEach @(
            "config/alz_variables_nonprod_global.json"
            "config/alz_variables_prod_global.json"
        ) {
            $_ | Should -Exist -Because "ESLZ Platform Deployments depend on this file"
        }
    }

    # Context "node stages" -Tag "config","base" {
    #     It "Has a node stages file node_stages.json" {
    #         "node_stages.json" | Should -Exist -Because "ECP depends on this file"
    #     }
    # }

    Context "tf" -Tag "platform","governance" {
        It "Has required file [<_>]" -ForEach @(
            "main.tf"
            "outputs.tf"
            "providers.tf"
            "variables.tf"
        ) {
            $_ | Should -Exist -Because "ESLZ Platform Deployments depend on this file"
        }
    }

    # Context "config pipeline" -Tag "config" {
    #     It "Has required file [pipeline/Release/multiStage.yml]" {
    #         "pipeline/Release/multiStage.yml" | Should -Exist -Because "ECP depends on this file"
    #     }
    # }

    # Context "config pipeline" -Tag "config","base" {
    #     It "Has required file [pipeline/Release/multiStage-Vars.yml]" {
    #         "pipeline/Release/multiStage-Vars.yml" | Should -Exist -Because "ECP depends on this file"
    #     }
    # }

    # Context "template pipeline" -Tag "template" {

    #     It "Has required file [<_>]" -ForEach @(
    #         (Join-Path ($pwd -split ("code[\\/]templates"))[0] "code\templates\pipeline\default\Release\multiStage-Vars.yml")
	# 		(Join-Path ($pwd -split ("code[\\/]templates"))[0] "code\templates\pipeline\default\Release\multiStage.yml")
    #     ) {
    #         $_ | Should -Exist -Because "ECP depends on this file"
    #     }
    # }

    # Context "template build pipeline" -Tag "template" {
    #     It "Has required file [<_>]" -ForEach @(
    #         "build/build.yml"
    #     ) {
    #         $_ | Should -Exist -Because "ECP depends on this file"
    #     }
    # }

}