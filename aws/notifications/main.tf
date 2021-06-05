terraform {
  required_version = "= 0.15.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 3.43.0"
    }
  }

}

resource "aws_ssm_parameter" "parameter_terraform" {
  name  = "/stuart-ellis/tf/timestamp"
  description = "Timestamp for Terraform run"
  overwrite = true
  value = timestamp()
  type  = "String"
}

resource "aws_sns_topic" "alerts" {
  name              = "stuart-ellis-alerts"
  display_name      = "aws-alerts"
}
