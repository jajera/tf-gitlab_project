
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.40.0"
    }
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = ">=15.8.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.2.1"
    }
  }
}

provider "azurerm" {
  features {}
  # subscription_id = var.subscription_id
}

provider "gitlab" {
  base_url = "https://gitlab/api/v4/"
  token    = "glpat-BtJoZTdzmZtzgz5m2fgs"
  insecure = true
}

provider "http" {
  # Configuration options
}
