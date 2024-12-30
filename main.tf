provider "aws" {
  region = "us-east-1"
  alias  = "us-east-1"
}

resource "aws_wafv2_web_acl" "this" {
  name        = var.waf_acl_name
  description = var.waf_acl_description
  provider    = aws.us-east-1
  scope       = var.scope
  tags        = var.tags

  default_action {
    allow {}
  }

  rule {
    name     = "AWSManaged-CommonRule"
    priority = 1

    override_action {
      none {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = false
      metric_name                = "static-site-${var.tenant_vars.product}-${var.tenant_vars.component}-AWSManagedCommonRuleSet-metric"
      sampled_requests_enabled   = false
    }
  }

  // default
  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "webACL"
    sampled_requests_enabled   = true
  }
}
