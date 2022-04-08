
resource "google_organization_iam_binding" "admin_binding" {
  for_each = toset(local.admin_roles)

  org_id = local.org_id
  role   = each.key

  members = local.admins
}

