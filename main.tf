module "iam_sub_a" {
  source   = "./modules/iam"
  providers = {
    aws = aws.sub_a
  }
}

module "iam_sub_b" {
  source   = "./modules/iam"
  providers = {
    aws = aws.sub_b
  }
}
