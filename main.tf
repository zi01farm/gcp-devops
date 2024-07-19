locals {
  project_id   = var.project_id
  network_name = "${var.env}-vpc-1"
  subnet_name  = "${var.env}-${var.region}-snet-1"
}

module "enable_apis" {
  source = "./modules/enable-apis"
}

module "kms" {
  source = "./modules/kms"

  region      = var.region
  environment = var.env

  depends_on = [
    module.enable_apis
  ]
}

module "iam" {
  source = "./modules/iam"

  environment                        = var.env
  default_confidential_crypto_key_id = module.kms.default_confidential_crypto_key_id
}

module "network" {
  source = "./modules/network"

  network_name = local.network_name
  project      = local.project_id
  region       = var.region
  subnet = {
    subnet_name               = local.subnet_name
    subnet_ip                 = "10.64.0.0/16"
    subnet_region             = var.region
    subnet_private_access     = "true"
    subnet_flow_logs          = "true"
    subnet_flow_logs_interval = "INTERVAL_10_MIN"
    subnet_flow_logs_sampling = 0.7
    subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
  }

  depends_on = [
    module.enable_apis
  ]
}

module "hello_world_service" {
  source              = "./modules/cloud-run"
  environment         = var.env
  region              = var.region
  service_name        = "my-hello-world-service"
  container_image_url = "us-docker.pkg.dev/cloudrun/container/hello"
  cloud_run_sa_email  = module.iam.cloud_run_sa_email
  encryption_key      = module.kms.default_confidential_crypto_key_id

  depends_on = [
    module.enable_apis
  ]
}
