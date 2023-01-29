# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED VARIABLES
# ---------------------------------------------------------------------------------------------------------------------

variable "display_name" {
  description = "The display name for the group."
  type        = string
}

variable "description" {
  description = "The description for the group."
  type        = string
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL VARIABLES
# ---------------------------------------------------------------------------------------------------------------------

variable "assignable_to_role" {
  description = "Indicates whether this group can be assigned to an Azure Active Directory role. Can only be true for security-enabled groups. Changing this forces a new resource to be created."
  type        = bool
  default     = true
}

variable "auto_subscribe_new_members" {
  description = "Indicates whether new members added to the group will be auto-subscribed to receive email notifications. Can only be set for Unified groups."
  type        = string
  default     = null
}

variable "behaviors" {
  description = "A set of behaviors for a Microsoft 365 group. Possible values are AllowOnlyMembersToPost, HideGroupInOutlook, SubscribeMembersToCalendarEventsDisabled, SubscribeNewGroupMembers and WelcomeEmailDisabled. See official documentation for more details. Changing this forces a new resource to be created."
  type        = set(string)
  default     = []
}

variable "dynamic_membership" {
  description = "A dynamic_membership block as documented below. Required when types contains DynamicMembership. Cannot be used with the members property."
  type = object({
    enabled = bool
    rule    = string
  })
  default = null
}

variable "external_senders_allowed" {
  description = "Indicates whether people external to the organization can send messages to the group. Can only be set for Unified groups."
  type        = bool
  default     = null
}

variable "hide_from_address_lists" {
  description = "Indicates whether the group is displayed in certain parts of the Outlook user interface: in the Address Book, in address lists for selecting message recipients, and in the Browse Groups dialog for searching groups. Can only be set for Unified groups."
  type        = bool
  default     = null
}

variable "hide_from_outlook_clients" {
  description = "Indicates whether the group is displayed in Outlook clients, such as Outlook for Windows and Outlook on the web. Can only be set for Unified groups."
  type        = bool
  default     = null
}

variable "mail_enabled" {
  description = "Whether the group is a mail enabled, with a shared group mailbox. At least one of mail_enabled or security_enabled must be specified. Only Microsoft 365 groups can be mail enabled (see the types property)."
  type        = bool
  default     = false
}

variable "mail_nickname" {
  description = "The mail alias for the group, unique in the organisation. Required for mail-enabled groups. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "members" {
  description = "A set of members who should be present in this group. Supported object types are Users, Groups or Service Principals. Cannot be used with the dynamic_membership block."
  type        = set(string)
  default     = null
}

variable "owners" {
  description = "A set of object IDs of principals that will be granted ownership of the group. Supported object types are users or service principals. By default, the principal being used to execute Terraform is assigned as the sole owner. Groups cannot be created with no owners or have all their owners removed."
  type        = set(string)
  default     = []
}

variable "prevent_duplicate_names" {
  description = "If true, will return an error if an existing group is found with the same name. Defaults to false."
  type        = bool
  default     = true
}

variable "provisioning_options" {
  description = "A set of provisioning options for a Microsoft 365 group. The only supported value is Team. See official documentation for details. Changing this forces a new resource to be created."
  type        = set(string)
  default     = ["Team"]
}

variable "security_enabled" {
  description = "Whether the group is a security group for controlling access to in-app resources. At least one of security_enabled or mail_enabled must be specified. A Microsoft 365 group can be security enabled and mail enabled (see the types property)."
  type        = bool
  default     = true
}

variable "theme" {
  description = "The colour theme for a Microsoft 365 group. Possible values are Blue, Green, Orange, Pink, Purple, Red or Teal. By default, no theme is set."
  type        = string
  default     = null
}

variable "types" {
  description = "A set of group types to configure for the group. Supported values are DynamicMembership, which denotes a group with dynamic membership, and Unified, which specifies a Microsoft 365 group. Required when mail_enabled is true. Changing this forces a new resource to be created."
  type        = set(string)
  default     = ["Unified"]
}

variable "visibility" {
  description = "The group join policy and group content visibility. Possible values are Private, Public, or Hiddenmembership. Only Microsoft 365 groups can have Hiddenmembership visibility and this value must be set when the group is created. By default, security groups will receive Private visibility and Microsoft 365 groups will receive Public visibility."
  type        = string
  default     = "Public"
}
