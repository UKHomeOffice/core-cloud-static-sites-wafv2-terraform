# AWS WAFv2 Terraform Module

This Terraform module creates an AWS WAFv2 Web ACL and allows you to associate it with an AWS resource such as an Application Load Balancer or CloudFront distribution.

## Requirements

- Terraform >= 1.0
- AWS Provider ~> 5.0

## Usage

```hcl
module "waf" {
  source            = "path_to_module"
  waf_acl_name      = "my-waf-acl"
  resource_arn      = "arn:aws:elasticloadbalancing:us-east-1:1************loadbalancer/app/my-load-balancer/************"
  tags              = {
    Environment = "non-prod"
    Project     = "MyApp"
  }
}


Variables


| Nmae       | Description      | Type      | Default   | Required 
|-----------------|----------------|-----------------|--------------|
| waf_acl_name | The name of the WAF ACL| string | n/a | Yes |
| waf_acl_description | A description for the WAF ACL | string | "WAF ACL" | No |
| scope | The scope of the WAF ACL (REGIONAL or CLOUDFRONT)	| string | "REGIONAL" | No |
| resource_arn | The ARN of the resource to associate with the WAF ACL | string | n/a | Yes |
| tags | A map of tags to assign to the resource | map(string)| {} | No |



Outputs



| Nmae       | Description     
|-----------------|----------------|
| waf_acl_id | The ID of the WAF ACL |
| waf_acl_arn | The ARN of the WAF ACL |


Default Rules
This module includes the following default managed rule groups:

AWSManagedRulesCommonRuleSet: Provides protection against common threats such as SQL Injection and XSS.
AWSManagedRulesBotControlRuleSet: Provides protection against common bot-related threats.


This module provides a basic setup with AWS-managed rules for general protection. You can modify or extend the rules as needed.
