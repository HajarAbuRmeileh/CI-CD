terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }

 backend "azurerm" {
    resource_group_name  = "Terraform"
    storage_account_name = "terraform4storage"
    container_name       = "tfstatefile"
     key                 = "dev.Terraform.tfstatefile"
    
}
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  # subscription_id = var.subscription_id
  # client_id       = var.client_id
  # client_secret   = var.client_secret
  # tenant_id       = var.tenant_id
}

resource "azurerm_container_registry" "acr" {
  name                     = "containerRegistry1"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  sku                      = "Premium"
  admin_enabled            = true
  georeplication_locations = ["East US", "West Europe"]
}

resource "azurerm_azuread_application" "acr-app" {
  name = "acr-app"
}

resource "azurerm_azuread_service_principal" "acr-sp" {
  application_id = "${azurerm_azuread_application.acr-app.application_id}"
}

resource "azurerm_azuread_service_principal_password" "acr-sp-pass" {
  service_principal_id = "${azurerm_azuread_service_principal.acr-sp.id}"
  value                = "Password12"
  end_date             = "2022-01-01T01:02:03Z"
}

resource "azurerm_role_assignment" "acr-assignment" {
  scope                = "${azurerm_container_registry.acr.id}"
  role_definition_name = "Contributor"
  principal_id         = "${azurerm_azuread_service_principal_password.acr-sp-pass.service_principal_id}"
}

   resource "null_resource" "docker_push" {
      provisioner "local-exec" {
      command = <<-EOT
        docker login ${azurerm_container_registry.acr.login_server} 
        docker push ${azurerm_container_registry.acr.login_server}
      EOT
      }
    }
