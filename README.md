# Level Up Programming - Terraform Infrastructure

This repository contains Terraform configuration for deploying a Google Cloud Run service as part of the Level Up Programming project. This is a part of a series of projects I am creating to (as the name suggests) level up my programming skills so that I have proof of my abilities to not only myself but to employers as well.

## Overview

This Terraform configuration provisions:
- A Google Cloud Run service running a simple "hello" container
- IAM binding to allow authenticated users to view the service
- Remote state management using Google Cloud Storage

## Prerequisites

- [Terraform](https://www.terraform.io/downloads) installed
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install) installed and configured
- A Google Cloud project with appropriate permissions
- A GCS bucket for Terraform state storage (currently: `bkt-terraform-state-54406`)

## Configuration

### Variables

The following variables are defined in `variables.tf`:

- `project_id` - The Google Cloud project ID
- `region` - The region where resources will be deployed
- `zone` - The zone within the region

Variable values are instantiated in `terraform.tfvars.json`
```

## Usage

### Initialize Terraform

```bash
terraform init
```

This command downloads the Google provider and configures the remote backend.

### Plan Changes

```bash
terraform plan
```

Review the planned changes before applying.

### Apply Configuration

```bash
terraform apply
```

This will create the Cloud Run service and IAM binding in your Google Cloud project.

### Destroy Resources

```bash
terraform destroy
```

Removes all resources created by this configuration.

## Resources Created

- **google_cloud_run_service.default** - Cloud Run service named `level-up-pro-srv`
- **google_cloud_run_service_iam_binding.binding** - IAM policy allowing all authenticated users to view the service

## File Structure

Terraform can only read config files at root level so that is why I left all the files in root.

```
.
├── backend.tf              # GCS backend configuration for remote state
├── cloud-run.tf            # Cloud Run service and IAM resources
├── provider.tf             # Google provider configuration
├── terraform.tfvars.json   # Variable values
├── variables.tf            # Variable definitions
```


## State Management

Terraform state is stored in a Google Cloud Storage bucket using the GCS backend. This enables collaboration and state persistence.

## Security Notes

- The IAM binding grants `roles/viewer` to `allAuthenticatedUsers`, allowing any authenticated Google account to view the service
- Ensure your GCS bucket for state storage has appropriate access controls
- Consider using service accounts with least-privilege access for Terraform operations
