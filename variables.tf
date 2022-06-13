variable "org_id" {
  type        = string
  default     = ""
  description = "Your GCP Organization ID."
}

variable "gcp_billing_account_name" {
  type        = string
  description = "Your GCP Billing Account Name"
}

variable "company_key" {
  type        = string
  default     = ""
  description = "Your company identifier, with no whitespace."
}

variable "admins" {
  type        = list(string)
  default     = []
  description = "Array of admins (users and service accounts) to assign admin roles to."
}

variable "admin_roles" {
  type        = list(string)
  default     = []
  description = "Array of roles to assign to admins"
}


variable "environments" {
  type        = list(string)
  default     = ["development", "uat", "production"]
  description = "Array of environments to create in GCP"
}

variable "active_googleapis" {
  type = list(string)
  default = [
    "appengine.googleapis.com",
    "cloudbilling.googleapis.com",
    "cloudbuild.googleapis.com",
    "cloudkms.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "containerregistry.googleapis.com",
    "iam.googleapis.com",
    "iamcredentials.googleapis.com",
    "logging.googleapis.com",
    "pubsub.googleapis.com",
    "storage-api.googleapis.com",
    "compute.googleapis.com",
    "container.googleapis.com",
    "vpcaccess.googleapis.com",
    "servicenetworking.googleapis.com",
    "networkmanagement.googleapis.com",
  ]
  description = "Array of apis to activate in GCP"
}

