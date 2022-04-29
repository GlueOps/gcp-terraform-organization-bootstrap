resource "google_kms_key_ring" "keyring" {
  project  = data.google_projects.env_project.projects[0].project_id
  name     = var.workspace
  location = "global"
}

resource "google_kms_crypto_key" "key" {
  name     = "encrypt_decrypt-${var.workspace}"
  key_ring = google_kms_key_ring.keyring.id
  purpose  = "ENCRYPT_DECRYPT"
  labels   = {}

  destroy_scheduled_duration = 4320

  lifecycle {
    prevent_destroy = true
  }
}

