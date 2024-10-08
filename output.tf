output "waf_acl_id" {
  description = "The ID of the WAF ACL"
  value       = aws_wafv2_web_acl.this.id
}

output "waf_acl_arn" {
  description = "The ARN of the WAF ACL"
  value       = aws_wafv2_web_acl.this.arn
}
