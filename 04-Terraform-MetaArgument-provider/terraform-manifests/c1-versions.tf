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

# Terraform Provider-1: us-central1
provider "google" {
  project = "gcplearn9"
  region = "us-central1"
  alias = "us-central1"    
}

# Terraform Provider-2: europe-west1
provider "google" {
  project = "gcplearn9"
  region = "europe-west1"
  alias = "europe-west1"    
}