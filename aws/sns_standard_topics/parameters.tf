resource "aws_ssm_parameter" "main" {
  for_each = aws_sns_topic.main

  name        = "/${var.namespace}/tf/${each.value.display_name}"
  description = "ARN for ${each.value.name}"
  overwrite   = true
  value       = each.value.arn
  type        = "String"
}
