terraform {
  required_providers {
    tanzu-mission-control = {
      source  = "vmware/tanzu-mission-control"
      version = "1.1.5"
    }
  }
}

provider "tanzu-mission-control" {
  endpoint = "https://vplpsamer.tmc.cloud.vmware.com/" # optionally use TMC_ENDPOINT env var
  # vmw_cloud_api_token = var.vmw_cloud_api_token # optionally use VMW_CLOUD_API_TOKEN env var
  insecure_allow_unverified_ssl = true

  # if you are using dev or different csp endpoint, change the default value below
  # for production environments the vmw_cloud_endpoint is console.cloud.vmware.com
  vmw_cloud_endpoint = "console.tanzu.broadcom.com"
}
