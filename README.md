# Set Google Cloud Constraints for Organization Policies

## Notes
* The intent of this repo is to be used in an environment for learning, demonstration, and proofs of concept (PoCs), **not production**.
* Leverage this script by calling it from other scripts if you intend to enable Google Cloud APIs in Terraform automation. 2 examples of a call:

```
module "orgpolicy" {
  source      = "github.com/kurtradecki/gcp-orgpolicies-demo"
  project_id  = "project_id"
  boolorgpols = ["",""]   # constraints that are 
  listorgpols = ["iam.allowedPolicyMemberDomains"]
}
```

module "orgpolicy" {
  source      = "github.com/kurtradecki/gcp-orgpolicies-demo"
  project_id  = "project_id"
  boolorgpols = ["","",""]   # constraints that are 
  listorgpols = []
}
```

