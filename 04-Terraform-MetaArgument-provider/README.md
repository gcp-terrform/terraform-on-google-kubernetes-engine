---
title: GCP Google Cloud Platform - Terraform Meta-Argument Provider
description: Learn Terraform Meta-Argument Provider
---

## Step-01: Introduction
- Learn [Terraform Meta-Argument Provider](https://developer.hashicorp.com/terraform/language/meta-arguments/resource-provider)

## Step-02: c1-versions.tf
```hcl
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
```

## Step-03: c3-vpc.tf
```hcl
# Resource: VPC
resource "google_compute_network" "myvpc" {
  project = "petromin-gms"
  name = "vpc1"
  auto_create_subnetworks = false   
}

# Resource: Subnet1
resource "google_compute_subnetwork" "mysubnet1" {
  provider = google.asia_south1_secondary   # Define provider to use
  name = "subnet1"
  ip_cidr_range = "10.128.0.0/20"
  network = google_compute_network.myvpc.id 
}

# Resource: Subnet2
resource "google_compute_subnetwork" "mysubnet2" {
  provider = google.asia_south1   # Define provider to use
  name = "subnet2"
  ip_cidr_range = "10.132.0.0/20"
  network = google_compute_network.myvpc.id 
}
```

## Step-04: Execute Terraform Commands
```t
# Terraform Initialize
terraform init

# Terraform Validate
terraform validate

# Terraform Plan
terraform plan

# Terraform Apply
terraform apply
Observation: 
1. Subnets will be created in both regions
```

## Step-05: Clean-Up
```t
# Terraform Destroy
terraform destroy --auto-approve
[or]
terraform apply --destroy --auto-approve
```
