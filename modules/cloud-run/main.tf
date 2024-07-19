resource "google_cloud_run_v2_service" "main" {
  provider = google-beta
  name     = "${var.service_name}-${var.environment}"
  location = var.region

  template {
    service_account = var.cloud_run_sa_email
    encryption_key  = var.encryption_key

    containers {
      image = var.container_image_url

      env {
        name  = "ENVIRONMENT"
        value = var.environment
      }
    }
  }
}

resource "google_cloud_run_v2_service_iam_member" "authorise" {
  location = google_cloud_run_v2_service.main.location
  project  = google_cloud_run_v2_service.main.project
  name     = google_cloud_run_v2_service.main.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}