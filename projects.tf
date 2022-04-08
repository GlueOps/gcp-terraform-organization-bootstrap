resource "google_project" "development" {
  name       = "${local.company_key}-development-2"
  project_id = "${local.company_key}-development-2"
  folder_id  = google_folder.core.name
}

resource "google_project" "uat" {
  name       = "${local.company_key}-uat-2"
  project_id = "${local.company_key}-uat-2"
  folder_id  = google_folder.core.name
}

resource "google_project" "production" {
  name       = "${local.company_key}-production-2"
  project_id = "${local.company_key}-production-2"
  folder_id  = google_folder.core.name
}

resource "google_folder" "core" {
  display_name = "${local.company_key} Core"
  parent       = "organizations/${local.org_id}"
}

