output "kms_key_arn" {
  description = "ARN of KMS key"
  value       = aws_kms_key.main.arn
}
