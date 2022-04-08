resource "google_folder" "core" {
  display_name = "${var.company_key} Core"
  parent       = "organizations/${var.org_id}"
}

resource "google_project" "development" {
  name       = "${var.company_key}-development"
  project_id = "${var.company_key}-development"
  folder_id  = google_folder.core.name
}

resource "google_project" "uat" {
  name       = "${var.company_key}-uat"
  project_id = "${var.company_key}-uat"
  folder_id  = google_folder.core.name
}

resource "google_project" "production" {
  name       = "${var.company_key}-production"
  project_id = "${var.company_key}-production"
  folder_id  = google_folder.core.name
}

