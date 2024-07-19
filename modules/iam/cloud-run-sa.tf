locals {
  sa_roles = [
    "roles/run.invoker"
  ]
}

resource "google_service_account" "cloud_run_sa" {
  account_id   = "cloud-run-invoker-${var.environment}-sa"
  display_name = "Cloud Run Invoker Service Account"
}

resource "google_project_iam_member" "cloud_run_sa_kms" {
  for_each = toset(local.sa_roles)
  project  = data.google_project.project.project_id
  role     = each.value
  member   = "serviceAccount:${google_service_account.cloud_run_sa.email}"
}