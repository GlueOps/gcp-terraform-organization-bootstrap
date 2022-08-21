data "google_billing_account" "acct" {
  display_name = var.gcp_billing_account_name
  open         = true
}


resource "google_folder" "core" {
  display_name = "${var.company_key} Core"
  parent       = "organizations/${var.org_id}"
  depends_on = [
    google_organization_iam_binding.admin_binding,
  ]
}
resource "google_project" "env_project" {
  for_each        = toset(var.environments)
  name            = "${var.company_key}-${each.value}"
  project_id      = "${var.company_key}-${each.value}"
  folder_id       = google_folder.core.name
  labels          = { "environment" : each.value }
  billing_account = data.google_billing_account.acct.id
}

locals {
  projects_data = {
    for project in google_project.env_project : project.labels.environment => project
  }
}

output "project_environments" {
  value = local.projects_data
}
  
output "gcp_folder_id" {
  value = nonsensitive(google_folder.core.name)
}

