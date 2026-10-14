# Terraform Settings Block
terraform {
  required_version = ">= 1.16.5"
  required_providers {
    google = {
      source = "hashicorp/google"
      version = ">= 8.7.0"
    }
  }
}

# Terraform Provider Block
provider "google" {
  project = "gcplearn9" # PROJECT_ID
  region = "us-central1"
}

