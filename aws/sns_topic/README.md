## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | = 3.71.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | = 3.71.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_sns_topic.alerts](https://registry.terraform.io/providers/hashicorp/aws/3.71.0/docs/resources/sns_topic) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_full_topic_name"></a> [full\_topic\_name](#input\_full\_topic\_name) | n/a | `string` | n/a | yes |
| <a name="input_short_topic_name"></a> [short\_topic\_name](#input\_short\_topic\_name) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sns_alerts_arn"></a> [sns\_alerts\_arn](#output\_sns\_alerts\_arn) | n/a |
