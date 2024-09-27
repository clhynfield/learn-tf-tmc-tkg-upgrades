# Learn vSphere with Tanzu upgrades with Terraform and Tanzu Mission Control

## Prerequisites

On workstation, install kubectl, k8s-cli-tools

Obtain a Cloud Services Portal API token and export in the
VMW_CLOUD_API_TOKEN environment variable (perhaps using .envrc and
direnv).

## Approach: Provision cluster with TMC provider v1.1.5, import with v1.4.5

tf-old-tmc-provider/main.tf
tf-old-tmc-provider/terraform.tf
