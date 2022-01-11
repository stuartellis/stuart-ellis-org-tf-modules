terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 3.71.0"
    }
  }

}

resource "aws_ssm_parameter" "parameter_terraform" {
  name        = "/${var.namespace}/tf/timestamp"
  description = "Timestamp for Terraform run"
  overwrite   = true
  value       = timestamp()
  type        = "String"
}
