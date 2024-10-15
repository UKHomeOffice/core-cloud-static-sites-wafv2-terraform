resource "aws_wafv2_web_acl" "this" {
  name        = var.waf_acl_name
  description = var.waf_acl_description
  scope       = var.scope

  default_action {
    allow {}
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "webACL"
    sampled_requests_enabled   = true
  }
}
