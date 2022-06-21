# terraform-gcp-organization-bootstrap


This Terraform module helps you bootstrap your organization in GCP with a core set of projects

Example usage:

```hcl

locals {
  org_id                   = "123456789"
  company_key              = "antoniostacos"
  gcp_billing_account_name = "My Billing Account"

  admins = [
    "user:venkata.mutyala@glueops.dev",
    "user:antonio.rodriguez@glueops.dev",
    "serviceAccount:svc-terraform@antoniostacos-1-svc-accounts.iam.gserviceaccount.com",
  ]

  # ref: https://cloud.google.com/iam/docs/understanding-roles
  admin_roles = [
    "roles/owner",
    "roles/resourcemanager.folderAdmin",
    "roles/iam.serviceAccountUser",
    "roles/logging.admin",
    "roles/serviceusage.serviceUsageAdmin",
    "roles/orgpolicy.policyAdmin",
    "roles/servicemanagement.quotaAdmin",
  ]
}


module "organization_and_project_bootstrap" {
  source                   = "github.com/GlueOps/terraform-gcp-organization-bootstrap.git"
  org_id                   = local.org_id
  company_key              = local.company_key
  admins                   = local.admins
  admin_roles              = local.admin_roles
  gcp_billing_account_name = local.gcp_billing_account_name
}
```


## Inputs Required:

| Name | Description | Required |
| --- | ----------- | -------- |
| org_id | Your GCP Organization ID. | Yes |
| gcp_billing_account_name | Your GCP Billing Account Name | Yes |
| company_key | Your company identifier, with no whitespace. | Yes |
| admins | Array of admins (users and service accounts) to assign admin roles to. | Yes |
| admin_roles | Array of roles to assign to admins | Yes |
| environments | Array of environments to create in GCP (1 per project) | Yes |
| active_googleapis | Array of apis to activate in GCP in each GCP Project | Yes |

Prerequisite:

1. At the Organization level, grant `Billing Account Administrator`, `Owner`, and `Organization Administrator` permissions to your user.
2. Create project for service accounts, e.g. `antoniostacos-1-svc-accounts`
ref: https://lunajacob.medium.com/setting-up-terraform-cloud-with-gcp-e1fe6c99a78e

3. Create a billing account for GCP and link the billing account to your service project.

4. Enable `Cloud Billing API` for service account, at https://console.cloud.google.com/apis/library/cloudbilling.googleapis.com.
   Enable `Resource Manager API` for service account, at https://console.cloud.google.com/apis/library/cloudresourcemanager.googleapis.com
   Enable `Cloud KMS API` for service account, at https://console.developers.google.com/apis/api/cloudkms.googleapis.com
   Enable `AppEngine API` for service account, at https://console.cloud.google.com/apis/library/appengine.googleapis.com
   Enable `CloudBuild API` for service account, at https://console.cloud.google.com/apis/library/cloudbuild.googleapis.com
   Enable `Kubernetes Engine API` for service account, at https://console.developers.google.com/apis/library/container.googleapis.com
   Enable `Service Networking` for service account, at: https://console.cloud.google.com/apis/api/servicenetworking.googleapis.com/
   Enable `Cloud SQL Admin API` for service account, at: https://console.cloud.google.com/apis/library/sqladmin.googleapis.com


5. open CloudShell in the service account project and run the following:
```
gcloud iam service-accounts create svc-terraform \
--description "Service account for all projects, used by Terraform Cloud" \
--display-name "svc-account for Terraform Cloud"
```

6. Retrieve service account email address using: `gcloud iam service-accounts list`
```
$ gcloud iam service-accounts list
DISPLAY NAME: svc-account for Terraform Cloud
EMAIL: svc-terraform@antoniostacos-1-svc-accounts.iam.gserviceaccount.com
DISABLED: False
```


7. At the `Organization` level, grant `Billing Account Administrator`, `Organization Administrator`, and `Project Creator` roles to `svc-terraform@antoniostacos-1-svc-accounts.iam.gserviceaccount.com`, so they apply to all projects.
Navigate to IAM and use the email address you saved to apply permissions.

8. For any domains that you plan to manage (ex. via App Engine) you need to ensure the service account is added as an owner to the domain here: https://www.google.com/webmasters/verification/home?hl=en You must do this for each domain you plan to use within GCP
