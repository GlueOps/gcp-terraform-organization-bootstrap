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
  for_each = {
    for env_api in local.env_apis :
    "${env_api.env}.${env_api.api}" => env_api
  }

  project = each.value.env
  service = each.value.api

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}

