resource "google_organization_policy" "org_policy_compute_skip_default_network_creation" {
  org_id     = var.org_id
  constraint = "compute.skipDefaultNetworkCreation"

  boolean_policy {
    enforced = true
  }
  depends_on = [
    google_organization_iam_binding.admin_binding,
  ]
}
