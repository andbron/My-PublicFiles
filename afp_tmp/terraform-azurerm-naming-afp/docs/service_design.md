When a new module is required for use, a Bootstrap process exists to create the underlying repository that the module will be developed in.

The below steps detail the process and standards to follow when creating a repository in the Modules project space.

Get the Clone URL for the ec.templates repository.

(https://<ado-org-name>@dev.azure.com/<ado-org-name>/<ado-modules-project>/\_git/<ado-repo-name>)

Use this URL to Clone the Bootstrap module locally in VS Code (or your editor of choice).

In order to execute the Bootstrap.ps1 file, you will need the following pieces of information;

**Personal Access Token (PAT)**: Manually Generated via your Azure DevOps instance.

**Module Name**: This should follow the format "terraform_modulename". for example for a policy assignment module "terraform_policy_assignment".

**Local Modules Directory:** This is just a local folder structure in your environment that will be used to stage files before uploading them to the DevOps instance.

**Setting the PAT Token as an Environment Variable**
Once you have the PAT token you need to set it in the execution context of the script. This is done via running $ENV:AZURE_DEVOPS_EXT_PAT = "<PATTOKENHERE>"

To execute and build the repo for use, the following command should be executed in the Terminal of your VS Code instance (substituting values for your own).

.\bootstrap.ps1 -moduleName "terraform_policy_assignment" -localModulesDirectory "C:\repos"

This should then successfully provision the desired repo in order to develop and publish for use.
