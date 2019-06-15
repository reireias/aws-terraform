terraform {
  backend "s3" {
    bucket  = "reireias-terraform"
    key     = "terraform/state"
    region  = "ap-northeast-1"
    profile = "default"
  }
}
