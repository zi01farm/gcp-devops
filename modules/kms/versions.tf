terraform {
  required_version = "~> 1.9.2"
  required_providers {
    google = {
      version = "5.38.0"
      source  = "hashicorp/google"
    }
    google-beta = {
      version = "5.38.0"
      source  = "hashicorp/google-beta"
    }
  }
}