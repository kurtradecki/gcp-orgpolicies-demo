/**
 * Copyright 2023 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


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
}
