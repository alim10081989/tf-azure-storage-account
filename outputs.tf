# Output declarations
output "storage_account_name" {
  description = "Storage Accout Name"
  value       = azurerm_storage_account.tfstate.name
}

output "unix_container_blob_name" {
  description = "Unix Container Blob Name"
  value       = azurerm_storage_container.unix-tfstate.name
}

output "win_container_blob_name" {
  description = "Windows Container Blob Name"
  value       = azurerm_storage_container.win-tfstate.name
}

output "unix_vm_backend_config" {
    value = <<EOT
        backend "azurerm" {
            resource_group_name  = "${azurerm_resource_group.tfstate.name}"
            storage_account_name = "${azurerm_storage_account.tfstate.name}"
            container_name       = "${azurerm_storage_container.unix-tfstate.name}"
            key                  = "terraform.tfstate"
            access_key           = "${azurerm_storage_account.tfstate.primary_access_key}"
  }
    EOT
    sensitive = false
}

output "win_vm_backend_config" {
    value = <<EOT
        backend "azurerm" {
            resource_group_name  = "${azurerm_resource_group.tfstate.name}"
            storage_account_name = "${azurerm_storage_account.tfstate.name}"
            container_name       = "${azurerm_storage_container.win-tfstate.name}"
            key                  = "terraform.tfstate"
            access_key           = "${azurerm_storage_account.tfstate.primary_access_key}"
  }
    EOT
    sensitive = false
}
