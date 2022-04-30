# terraform-gcp-organization-bootstrap

Prerequisite: TFC service account needs the following roles:
* `Organization Administrator` 
* `Project Creator` 

Activate the billing API for the service account (`cloudbilling.googleapis.com`)

If you get into a weird state destroying this stack due to permissions, TF dependency management didn't work as expected and the `organizationAdmin` role must be added manually in console before executing the destroy operation again.

