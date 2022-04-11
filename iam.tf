# Separating apply of organizationAdmin role because it must be applied first and destroyed last.
resource "google_organization_iam_binding" "org_admin_binding" {
  org_id = var.org_id
  role   = "roles/resourcemanager.organizationAdmin"

  members = var.admins
}

resource "google_organization_iam_binding" "admin_binding" {
  for_each = toset(var.admin_roles)

  org_id = var.org_id
  role   = each.key

  members = var.admins

  depends_on = [
    google_organization_iam_binding.org_admin_binding
  ]
}

