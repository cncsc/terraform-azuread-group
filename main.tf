# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# APPLY CONFIGURATION TO A GITHUB ORGANIZATION
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

terraform {
  required_version = ">= 0.12.26"

  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 2.30.0"
    }
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE THE GROUP
# ---------------------------------------------------------------------------------------------------------------------

resource "azuread_group" "group" {
  display_name = var.display_name
  description  = var.description
  visibility   = var.visibility

  members = var.members
  owners  = var.owners

  prevent_duplicate_names = var.prevent_duplicate_names

  auto_subscribe_new_members = contains(var.types, "Unified") ? var.auto_subscribe_new_members : null
  behaviors                  = contains(var.types, "Unified") ? var.behaviors : null
  external_senders_allowed   = contains(var.types, "Unified") ? var.external_senders_allowed : null
  hide_from_address_lists    = contains(var.types, "Unified") ? var.hide_from_address_lists : null
  hide_from_outlook_clients  = contains(var.types, "Unified") ? var.hide_from_outlook_clients : null
  theme                      = contains(var.types, "Unified") ? var.theme : null

  mail_enabled  = contains(var.types, "Unified") ? var.mail_enabled : false
  mail_nickname = var.mail_nickname

  security_enabled   = var.security_enabled
  assignable_to_role = var.security_enabled == true ? var.assignable_to_role : null

  provisioning_options = contains(var.types, "Unified") ? var.provisioning_options : null

  dynamic "dynamic_membership" {
    for_each = contains(var.types, "DynamicMembership") && var.dynamic_membership != null ? [1] : []

    content {
      enabled = var.dynamic_membership.enabled
      rule    = var.dynamic_membership.rule
    }
  }
}
