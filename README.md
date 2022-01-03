# stuart-ellis-org-tf-modules

Terraform modules for stuartellis.org environments.

This uses these providers:

- [hashicorp/aws](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

## Testing

To test a module with [TFLint](https://github.com/terraform-linters/tflint):

    TFLINT_PLUGIN_DIR=plugins/tflint tflint -c config/.tflint.hcl <MODULE_DIR>

> This configuration uses deep check to validate against your live AWS environment.
