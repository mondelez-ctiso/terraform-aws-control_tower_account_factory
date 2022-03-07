data "aws_caller_identity" "current" {}

data "aws_kms_alias" "aft" {
  name = "alias/aft"
}

data "aws_kms_secret" "admin_stack_management" {
  secret {
    name    = "terraformrc"
    payload = file("${path.module}/secrets/${data.aws_caller_identity.current.account_id}/.terraformrc.enc")
    context = {
      AccountID = data.aws_caller_identity.current.account_id
    }
  }
}
