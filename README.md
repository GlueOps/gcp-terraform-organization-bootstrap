# terraform-gcp-organization-bootstrap

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