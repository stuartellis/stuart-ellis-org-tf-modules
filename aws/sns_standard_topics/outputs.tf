output "sns_topic_arns" {
  value = {
    for k, v in aws_sns_topic.main : k => v.id
  }
}
