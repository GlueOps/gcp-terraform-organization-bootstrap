# terraform-gcp-organization-bootstrap

Prerequisite: TFC service account needs the following roles:
* `Organization Administrator` 
* `Project Creator` 
* `Quota Administrator` 

If you get into a weird state destroying this stack due to permissions, TF dependency management didn't work as expected and the `organizationAdmin` role must be added manually in console before executing the destroy operation again.

## TODO

Need to activate Billing.
Rename billing account. https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/billing_account
