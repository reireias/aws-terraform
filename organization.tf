resource "aws_organizations_organization" "reireias" {}

resource "aws_organizations_account" "subaccount_a" {
  name  = "subaccount_a"
  email = "reireias+aws-sub-a@gmail.com"
}
