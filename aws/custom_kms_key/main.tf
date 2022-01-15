terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 3.71.0"
    }
  }

}

resource "aws_kms_key" "main" {
  description             = "Key for ${var.key_name}"
  deletion_window_in_days = 7
}

resource "aws_kms_alias" "main" {
  name          = "alias/${var.key_name}"
  target_key_id = aws_kms_key.main.key_id
}
