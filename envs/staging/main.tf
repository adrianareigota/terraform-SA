terraform {
  required_version = ">= 1.6"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

module "vm" {
  source        = "../../modules/compute_instance"
  project       = var.project
  region        = var.region
  zone          = var.zone
  name          = var.name
  machine_type  = var.machine_type
  labels        = var.labels
  network_tags  = var.network_tags
}
