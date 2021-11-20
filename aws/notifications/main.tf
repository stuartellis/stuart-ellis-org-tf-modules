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
  name         = "stuart-ellis-alerts"
  display_name = "aws-alerts"
}

resource "aws_sns_topic_subscription" "root_email" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = var.root_email
}

resource "aws_sns_topic_subscription" "project_email_0001" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = var.projects.app0001.email
}

