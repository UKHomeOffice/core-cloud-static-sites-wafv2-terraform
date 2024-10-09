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

variable "resource_arn" {
  description = "The ARN of the resource to associate with WAF ACL"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
