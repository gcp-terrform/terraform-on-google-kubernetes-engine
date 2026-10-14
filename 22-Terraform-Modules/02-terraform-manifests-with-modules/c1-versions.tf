# Terraform Settings Block
terraform {
  required_version = ">= 1.16.5"
  required_providers {
    google = {
      source = "hashicorp/google"
      version = ">= 8.7.0"
    }
  }
  backend "gcs" {
    bucket = "gcplearn9-tfstate"
    prefix = "env/tf-module"
  }  
}

# Terraform Provider Block
provider "google" {
  project = var.gcp_project
  region = var.gcp_region1
}

