terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 3.66.0"
    }
  }

}

resource "aws_sns_topic" "alerts" {
  name         = var.full_topic_name
  display_name = var.short_topic_name
}
