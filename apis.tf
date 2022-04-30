locals {
  env_apis = distinct(flatten([
    for env in var.environments : [
      for api in var.active_googleapis : {
        env = env
        api = api
      }
    ]
  ]))
}


resource "google_project_service" "activate_apis" {
  for_each = local.env_apis

  project = each.value.env
  service = each.value.api

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}

