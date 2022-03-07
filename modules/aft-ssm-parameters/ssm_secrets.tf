resource "aws_ssm_parameter" "terraformrc" {
  name   = "/aft/terraform/terraformrc"
  type   = "SecureString"
  value  = data.aws_kms_secrets.admin_stack_management.plaintext.terraformrc
  key_id = data.aws_kms_alias.aft.name
}
