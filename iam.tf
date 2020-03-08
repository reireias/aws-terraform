resource "aws_iam_user" "billing_bucket" {
  name = "billing.bucket.read"

  tags = {
    Name = "billing.bucket.read"
  }
}

resource "aws_iam_user_policy" "billing_bucket" {
  name   = "billing.bucket"
  user   = aws_iam_user.billing_bucket.name
  policy = data.aws_iam_policy_document.billing_bucket.json
}

data "aws_iam_policy_document" "billing_bucket" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.billing.arn}/*"]
  }
}
