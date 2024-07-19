locals {
  rotation_period = "7776000s"
}

resource "google_kms_key_ring" "default" {
  name     = "default-${var.region}-${var.environment}-keyring"
  location = var.region
}

resource "google_kms_crypto_key" "default_confidential" {
  name            = "confidential-key"
  key_ring        = google_kms_key_ring.default.id
  rotation_period = local.rotation_period

  lifecycle {
    prevent_destroy = true
  }
}