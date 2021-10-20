provider "aws" {
  version = "3.18.0"
  region  = "ap-northeast-1"
}

provider "aws" {
  alias  = "sub_a"
  region = "ap-northeast-1"

  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.subaccount_a.id}:role/OrganizationAccountAccessRole"
  }
}

provider "aws" {
  alias  = "sub_b"
  region = "ap-northeast-1"

  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.subaccount_b.id}:role/OrganizationAccountAccessRole"
  }
}
