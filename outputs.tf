output "mail" {
  value       = azuread_group.group.mail
  description = "The SMTP address for the group."
}

output "object_id" {
  value       = azuread_group.group.object_id
  description = "The ID of the organization."
}

output "onpremises_domain_name" {
  value       = azuread_group.group.onpremises_domain_name
  description = "The on-premises FQDN, also called the dnsDomainName, synchronized from the on-premises directory when Azure AD Connect is used."
}

output "onpremises_netbios_name" {
  value       = azuread_group.group.onpremises_netbios_name
  description = "The on-premises NetBIOS name, synchronized from the on-premises directory when Azure AD Connect is used."
}

output "onpremises_sam_account_name" {
  value       = azuread_group.group.onpremises_sam_account_name
  description = "The on-premises SAM account name, synchronized from the on-premises directory when Azure AD Connect is used."
}

output "onpremises_security_identifier" {
  value       = azuread_group.group.onpremises_security_identifier
  description = "The on-premises security identifier (SID), synchronized from the on-premises directory when Azure AD Connect is used."
}

output "onpremises_sync_enabled" {
  value       = azuread_group.group.onpremises_sync_enabled
  description = "Whether this group is synchronized from an on-premises directory (`true`), no longer synchronized (`false`), or has never been synchronized (`null`)."
}

output "preferred_language" {
  value       = azuread_group.group.preferred_language
  description = "The preferred language for a Microsoft 365 group, in ISO 639-1 notation."
}

output "proxy_addresses" {
  value       = azuread_group.group.proxy_addresses
  description = "List of email addresses for the group that direct to the same group mailbox."
}
