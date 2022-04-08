resource "google_organization_policy" "org_policy_compute_skip_default_network_creation" {
  org_id     = local.org_id
  constraint = "compute.skipDefaultNetworkCreation"

  boolean_policy {
    enforced = true
  }
}