variable "project_id" {
  description = "Project ID to deploy into"
  type        = string
}

variable "env" {
  description = "Environment"
  type        = string
}

variable "region" {
  description = "The region to deploy to"
  default     = "europe-west2"
  type        = string
}