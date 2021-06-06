terraform {
  required_version = "= 0.15.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 3.43.0"
    }
  }

}

resource "aws_cloudwatch_metric_alarm" "billing_threshold_alarm" {
  alarm_name = "billing_threshold_alarm"
  alarm_description = "A CloudWatch Alarm that triggers the AWS bill reaches the specified threshold (default: 100 USD)."
  metric_name = "EstimatedCharges"
  namespace = "AWS/Billing"
  statistic = "Maximum"
  period = "21600"
  threshold = "100"
  evaluation_periods = "1"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  alarm_actions = [ "${var.sns_alerts_arn}" ]
  dimensions = {
    Currency = "USD"
  }
}
