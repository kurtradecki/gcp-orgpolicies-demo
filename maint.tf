locals {
  boolorgpols_map = { for index, boolorgpol in var.boolorgpols : "${index}" => boolorgpol }
  listorgpols_map = { for index, listorgpol in var.listorgpols : "${index}" => listorgpol }
}

module "bool_org_policy" {
  source      = "terraform-google-modules/org-policy/google"
  for_each    = local.boolorgpols_map
  policy_for  = "project"
  project_id  = var.project_id
  constraint  = "constraints/${each.value}"
  policy_type = "boolean"
  enforce     = false
  #  version           = "~> 3.0.2"
}

# allow all / deny all type org policies
module "list_org_policy" {
  source      = "terraform-google-modules/org-policy/google"
  for_each    = local.listorgpols_map
  policy_for  = "project"
  project_id  = var.project_id
  constraint  = "constraints/${each.value}"
  policy_type = "list"
  enforce     = false
  #  version           = "~> 3.0.2"
}
