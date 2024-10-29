# AWS WAFv2 Terraform Module

This Terraform module creates an AWS WAFv2 Web ACL and allows you to associate it with an AWS resource such as an Application Load Balancer or CloudFront distribution.

## External Links
https://github.com/UKHomeOffice/core-cloud-static-site-terragrunt
https://collaboration.homeoffice.gov.uk/display/CORE/Core+Cloud+Static+Sites
https://collaboration.homeoffice.gov.uk/display/CORE/Static+Sites+Repositories

## Changelog

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

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_wafv2_web_acl.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_scope"></a> [scope](#input\_scope) | Specifies whether this is for CloudFront or regional | `string` | `"REGIONAL"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resource. | `map(string)` | `{}` | no |
| <a name="input_waf_acl_description"></a> [waf\_acl\_description](#input\_waf\_acl\_description) | A description for the WAF ACL | `string` | `"WAF ACL for managing HTTP/HTTPS access."` | no |
| <a name="input_waf_acl_name"></a> [waf\_acl\_name](#input\_waf\_acl\_name) | The name of the WAF ACL | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_waf_acl_arn"></a> [waf\_acl\_arn](#output\_waf\_acl\_arn) | The ARN of the WAF ACL |
| <a name="output_waf_acl_id"></a> [waf\_acl\_id](#output\_waf\_acl\_id) | The ID of the WAF ACL |
<!-- END_TF_DOCS -->