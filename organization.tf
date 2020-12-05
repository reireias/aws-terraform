resource "aws_organizations_organization" "reireias" {}

resource "aws_organizations_account" "subaccount_a" {
  name  = "subaccount_a"
  email = "reireias+aws-sub-a@gmail.com"
}

resource "aws_organizations_account" "subaccount_b" {
  name  = "subaccount_b"
  email = "reireias+aws-sub-b@gmail.com"
}
