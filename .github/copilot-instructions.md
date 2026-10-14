# Copilot instructions

## Repository overview

This repository is a course-style collection of independent Terraform and GKE demonstrations, not a single deployable Terraform root. The root `README.md` indexes the learning path: Terraform fundamentals, GKE cluster/network infrastructure, Kubernetes workloads and storage, Gateway API, then reusable modules and Cloud Build CI/CD examples. Each numbered demo's README explains its own intended configuration and workflow.

Most Terraform roots are nested in demo-specific directories. Later demos commonly separate infrastructure (VPC, GKE cluster, networking) from workload resources (Kubernetes deployments, services, storage, or Gateway API). Workload roots may obtain cluster outputs using `terraform_remote_state` with a GCS backend; keep those backend bucket names, state prefixes, and output names consistent with the infrastructure root they consume.

The custom-module demos follow the same separation: reusable code lives under `modules/` and is called by a separate root configuration. The CI/CD demos mirror infrastructure or workload repositories under `Git-Repo-files` / `Git-Repo-Files`, with `environments/dev` and `environments/prod` roots. Their Cloud Build Terraform pipelines select an environment using `$BRANCH_NAME`, plan environments, and only apply on environment branches. Application Cloud Build configurations instead build and push container images.

## Commands

There is no repository-wide test, build, or lint runner. Terraform CLI commands are run from an individual configuration root; choose the directory documented for the demo you are changing. For example:

```sh
terraform -chdir=09-GKE-Public-Standard-Cluster/p1-gke-public-cluster fmt -check
terraform -chdir=09-GKE-Public-Standard-Cluster/p1-gke-public-cluster init
terraform -chdir=09-GKE-Public-Standard-Cluster/p1-gke-public-cluster validate
terraform -chdir=09-GKE-Public-Standard-Cluster/p1-gke-public-cluster plan
```

For a single configuration, replace the example path with that configuration root. Run `init` before `validate` when providers or modules have not been initialized. Initialization and planning may need Google Cloud credentials and access to the configured GCS backend. `plan` is the non-applying infrastructure check; applying or destroying changes affects real cloud resources and must be intentional.

## Repository conventions

- Treat each self-contained Terraform directory as its own root and state boundary. Do not combine unrelated demos or run Terraform recursively as if the repository had one root.
- Follow the demo's existing numbered `.tf` file sequence (often `c1-versions.tf`, variables/locals, network, cluster, then outputs) and its resource naming. The README code snippets are part of the course material; update them when changing the corresponding implementation.
- Declare Terraform and provider constraints in the root's `c1-versions.tf` or `versions.tf`. Current Terraform requirements are `>= 1.16.5`; keep pinned `hashicorp/terraform` Cloud Build images and documented install examples aligned when changing that baseline. Modules may declare their own provider requirements.
- Preserve the infrastructure/workload handoff: remote-state consumers depend on producer output names as well as the exact GCS bucket and prefix. Environment-specific backend prefixes should remain isolated for `dev` and `prod`.
- Provider configuration commonly reads project and region from demo variables such as `gcp_project` and `gcp_region1`. Keep variable names and `.tfvars` examples in sync with the root module that consumes them.
- These examples include project IDs, bucket names, domains, and other account-specific settings. Do not assume a sample value exists in the current user's account; retain placeholders or update all linked examples and configuration consistently.
