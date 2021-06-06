terraform {
  required_version = "= 0.15.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 3.43.0"
    }
  }

}

resource "aws_sns_topic" "alerts" {
  name              = "stuart-ellis-alerts"
  display_name      = "aws-alerts"
}

resource "aws_sns_topic_subscription" "root_email" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = var.root_email
}
