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

# Terraform Provider-1: asia-south1
provider "google" {
  project = "petromin-gms"
  region = "asia-south1"
  alias = "asia_south1"
}

# Terraform Provider-2: asia-south1 secondary
provider "google" {
  project = "petromin-gms"
  region = "asia-south1"
  alias = "asia_south1_secondary"
}
