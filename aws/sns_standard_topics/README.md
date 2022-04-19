## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | = 4.10.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | = 4.10.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_sns_topic.main](https://registry.terraform.io/providers/hashicorp/aws/4.10.0/docs/resources/sns_topic) | resource |
| [aws_ssm_parameter.main](https://registry.terraform.io/providers/hashicorp/aws/4.10.0/docs/resources/ssm_parameter) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_namespace"></a> [namespace](#input\_namespace) | The prefix for resource identifiers | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sns_topic_arns"></a> [sns\_topic\_arns](#output\_sns\_topic\_arns) | n/a |
