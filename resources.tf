# See: https://developer.hashicorp.com/terraform/docs
# Terraform configuration
# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

# Provider configuration
# See https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
provider "azurerm" {
  features {

  }
}

# Define "location" variable with a default
variable "location" {
    type = string
    default = "Switzerland"
}

# Define "location2" variable without a default
# So it must be set in a "env.tfvars" file
variable "location2" {
    type = string
}

# Define Resources or Data
# Example: resource group
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = location
}
# Example: redis cache 
# See docs: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/redis_cache
# Or code: https://github.com/hashicorp/terraform-provider-azurerm/tree/main/internal/services/redis
resource "azurerm_redis_cache" "my_redis" {
    capacity = 1
    family = ""
    resource_group_name = azurerm_resource_group.example.name # Object syntax of dependent resource
    sku_name = ""
    location = ""
    name = ""
}
