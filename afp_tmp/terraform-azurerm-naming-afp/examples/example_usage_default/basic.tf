module "tf_example" {
  source = "git::https://dev.azure.com/<ado_org>/<tf_modules_project>/_git/tf_example?ref=1.0.0"

  rg_name  = "rg-name"  #required
  location = "location" #required

}
