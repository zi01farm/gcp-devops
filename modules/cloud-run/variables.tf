variable "service_name" {
  type    = string
  default = "hello-world-service"
}

variable "region" {
  type    = string
  default = "europe-west2"
}

variable "environment" {
  type        = string
  description = "Environment"
}

variable "encryption_key" {
  type    = string
  default = null
}

variable "container_image_url" {
  type = string
}

variable "cloud_run_sa_email" {
  type        = string
  description = "The API Service Account email"
}
