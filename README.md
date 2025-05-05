# Set Google Cloud Constraints for Organization Policies

## Notes
* The intent of this repo is to be used in an environment for learning, demonstration, and proofs of concept (PoCs), **not production**.
* Leverage this script by calling it from other scripts if you intend to enable Google Cloud APIs in Terraform automation. 2 examples of a call:

```
module "orgpolicy" {
  source      = "github.com/kurtradecki/gcp-orgpolicies-demo"
  project_id  = "project_id"
  boolorgpols = ["compute.requireShieldedVm"]   # boolean constraints that are enforced / not enforced
  listorgpols = ["iam.allowedPolicyMemberDomains", "compute.vmCanIpForward", "compute.vmExternalIpAccess"]   # list constraints that are allow all / deny all / custom
}
```

```
module "orgpolicy" {
  source      = "github.com/kurtradecki/gcp-orgpolicies-demo"
  project_id  = "project_id"
  boolorgpols = []   # no booelan constraints that are enforced / not enforced
  listorgpols = ["compute.trustedImageProjects"]   # list constraints that are allow all / deny all  / custom
}
```

For more on list contraints, see [Use list constraints with an organization policy[(https://cloud.google.com/resource-manager/docs/organization-policy/using-constraints#list-constraint)

For more on boolean constaints, see [Using boolean constraints in organization policy](https://cloud.google.com/resource-manager/docs/organization-policy/using-constraints#boolean-constraint)
