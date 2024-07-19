locals {
  enable_apis = [
    "run.googleapis.com",
    "iam.googleapis.com",
    "cloudkms.googleapis.com",
    "iap.googleapis.com",
    "compute.googleapis.com"
  ]
}

resource "google_project_service" "enable_apis" {
  for_each                   = toset(local.enable_apis)
  service                    = each.value
  disable_dependent_services = false
  disable_on_destroy         = false
}