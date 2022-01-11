// Minimal WAFv2 Configuration

// From: https://asecure.cloud/a/AWS_WAF_Common/

terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 3.71.0"
    }
  }

}

resource "aws_wafv2_web_acl" "WafWebAcl" {
  name = "WAF_Common_Protections"
  scope = "CLOUDFRONT"

  default_action {
    block {
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name = "${var.cw_namespace}/WAF_Common_Protections"
    sampled_requests_enabled = true
  }

  rule {
    name = "AWSManagedRulesCommonRule"
    priority = 0
    override_action {
      none {
      }
    }
    statement {
      managed_rule_group_statement {
        name = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"
      }
    }
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name = "${var.cw_namespace}/AWSManagedRulesCommonRule"
      sampled_requests_enabled = true
    }
  }
  rule {
    name = "AWSManagedRulesKnownBadInputsRule"
    priority = 1
    override_action {
      none {
      }
    }
    statement {
      managed_rule_group_statement {
        name = "AWSManagedRulesKnownBadInputsRuleSet"
        vendor_name = "AWS"
      }
    }
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name = "${var.cw_namespace}/AWSManagedRulesKnownBadInputsRule"
      sampled_requests_enabled = true
    }
  }
  rule {
    name = "AWSManagedRulesAmazonIpReputation"
    priority = 2
    override_action {
      none {
      }
    }
    statement {
      managed_rule_group_statement {
        name = "${var.cw_namespace}/AWSManagedRulesAmazonIpReputationList"
        vendor_name = "AWS"
      }
    }
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name = "${var.cw_namespace}/AWSManagedRulesAmazonIpReputation"
      sampled_requests_enabled = true
    }
  }
}