resource "google_folder" "core" {
  display_name = "${var.company_key} Core"
  parent       = "organizations/${var.org_id}"
  depends_on = [
    google_organization_iam_binding.admin_binding,
  ]
}
resource "google_project" "env_project" {
  for_each   = toset(var.environments)
  name       = "${var.company_key}-${each.value}"
  project_id = "${var.company_key}-${each.value}"
  folder_id  = google_folder.core.name
}
