## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | = 3.74.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | = 3.74.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.notifiers](https://registry.terraform.io/providers/hashicorp/aws/3.74.1/docs/resources/iam_policy) | resource |
| [aws_iam_role.notifiers](https://registry.terraform.io/providers/hashicorp/aws/3.74.1/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.notifiers](https://registry.terraform.io/providers/hashicorp/aws/3.74.1/docs/resources/iam_role_policy_attachment) | resource |
| [aws_ssm_maintenance_window.weekly_linux](https://registry.terraform.io/providers/hashicorp/aws/3.74.1/docs/resources/ssm_maintenance_window) | resource |
| [aws_ssm_maintenance_window_target.ubuntu_standard](https://registry.terraform.io/providers/hashicorp/aws/3.74.1/docs/resources/ssm_maintenance_window_target) | resource |
| [aws_ssm_maintenance_window_task.ssm_agent_update](https://registry.terraform.io/providers/hashicorp/aws/3.74.1/docs/resources/ssm_maintenance_window_task) | resource |
| [aws_ssm_maintenance_window_task.ubuntu_update](https://registry.terraform.io/providers/hashicorp/aws/3.74.1/docs/resources/ssm_maintenance_window_task) | resource |
| [aws_ssm_patch_baseline.ubuntu_standard](https://registry.terraform.io/providers/hashicorp/aws/3.74.1/docs/resources/ssm_patch_baseline) | resource |
| [aws_ssm_patch_group.patchgroup](https://registry.terraform.io/providers/hashicorp/aws/3.74.1/docs/resources/ssm_patch_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_sns_alerts_arn"></a> [sns\_alerts\_arn](#input\_sns\_alerts\_arn) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
