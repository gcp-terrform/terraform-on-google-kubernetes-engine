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
  project = "petromin-gms" # PROJECT_ID
  region = "asia-south1"
}

