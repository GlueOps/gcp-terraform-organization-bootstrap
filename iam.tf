resource "google_organization_iam_binding" "admin_binding" {
  for_each = toset(var.admin_roles)

  org_id = var.org_id
  role   = each.key

  members = var.admins
}

