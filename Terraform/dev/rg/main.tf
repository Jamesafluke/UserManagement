terraform {
  required_version = ">= 1.0.0, < 2.0.0"
  backend "local" {}
  #backend "azurerm" {
  #resource_group_name  = "rg-tfstate"
  #storage_account_name = "satfstate109234"
  #container_name       = "tfstate"
  #key                  = "usermanagement/dev/rg/terraform.tfstate"
  #}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.94.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

locals{
  location = "westus2"
  resource_group_name = "rg-aks-userManagement"
  environment = "dev"
}

module "rg" {
  source = "github.com/Jamesafluke/TerraformModules//rg"
  location = local.location
  rg_name  = local.resource_group_name
}



module "aks_cluster" {
  source = "github.com/Jamesafluke/TerraformModules//aksCluster"
  name = "aks-userManagement"
  location = local.location
  resource_group_name = local.resource_group_name
  environment = local.environment
}