resource "aws_sns_topic" "main" {
  for_each = toset(local.levels)

  name         = "${var.namespace}-alerts-${lower(each.key)}"
  display_name = "${var.namespace}-${lower(each.key)}"

  tags = {
    "${var.namespace}:tf:alertlevel" = each.key
  }
}
