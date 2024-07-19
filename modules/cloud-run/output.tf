output "project_id" {
  value = google_cloud_run_v2_service.main.project
}

output "service_url" {
  value = google_cloud_run_v2_service.main.uri
}

output "service_name" {
  value = google_cloud_run_v2_service.main.name
}

output "service_id" {
  value = google_cloud_run_v2_service.main.id
}

output "service_location" {
  value = google_cloud_run_v2_service.main.location
}