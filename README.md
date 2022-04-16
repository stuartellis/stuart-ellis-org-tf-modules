# stuart-ellis-org-tf-modules

Terraform modules for stuartellis.org environments.

This uses these providers:

- [hashicorp/aws](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [hashicorp/azurerm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)

## Testing

To test a module with [TFLint](https://github.com/terraform-linters/tflint), specify a TFLint configuration file:

    export TFLINT_PLUGIN_DIR=plugins/tflint 
    tflint -c config/.tflint.aws.hcl --init <MODULE_DIR>

> The AWS configuration uses deep check to validate against your live AWS environment.
