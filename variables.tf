variable "org_id" {
  type        = string
  default     = ""
  description = "Your GCP Organization ID."
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
  default     = ["development", "jsakldslakdj", "production"]
  description = "Array of environments to create in GCP"
}

