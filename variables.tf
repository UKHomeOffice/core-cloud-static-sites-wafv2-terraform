variable "waf_acl_name" {
  description = "The name of the WAF ACL"
  type        = string
}

variable "waf_acl_description" {
  description = "A description for the WAF ACL"
  type        = string
  default     = "WAF ACL for managing HTTP/HTTPS access."
}

variable "scope" {
  description = "Specifies whether this is for CloudFront or regional"
  type        = string
  default     = "REGIONAL"
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "tenant_vars" {
  description = "A map of values specific to tenant"
  type        = any
  default     = {}
}
