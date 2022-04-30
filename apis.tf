locals {
  project_apis = distinct(flatten([
    for project in local.projects_data : [
      for api in var.active_googleapis : {
        project = project.project_id
        api     = api
      }
    ]
  ]))
}


resource "google_project_service" "activate_apis" {
  for_each = {
    for project_api in local.project_apis :
    "${project_api.project}.${project_api.api}" => project_api
  }

  project = each.value.project
  service = each.value.api

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}

