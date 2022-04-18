terraform {
    required_version = ">= 1.0.0"

    required_providers {
      aws = {
          source = "hashicorp/aws"
          version = "= 4.10.0"
      }
    }
}

locals {
  levels = [
      "DEBUG", 
      "ERROR", 
      "INFO", 
      "WARN"
  ]
}

resource "aws_sns_topic" "current" {
  for_each = toset(local.levels)

  name = "${var.namespace}-alerts-${lower(each.key)}"
  display_name = "${var.namespace}-${lower(each.key)}"

  tags = {
    "${var.namespace}:tf:alertlevel" = each.key
  }
}
