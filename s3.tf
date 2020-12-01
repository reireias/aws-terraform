resource "aws_s3_bucket" "billing" {
  bucket = "reireias-aws-billing"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name = "reireias-aws-billing"
  }
}

data "aws_iam_policy_document" "billing" {
  statement {
    principals {
      type        = "Service"
      identifiers = ["billingreports.amazonaws.com"]
    }

    actions = [
      "s3:GetBucketAcl",
      "s3:GetBucketPolicy",
    ]

    resources = [
      aws_s3_bucket.billing.arn
    ]
  }

  statement {
    principals {
      type        = "Service"
      identifiers = ["billingreports.amazonaws.com"]
    }

    actions = [
      "s3:PutObject",
    ]

    resources = [
      "${aws_s3_bucket.billing.arn}/*"
    ]
  }
}

resource "aws_s3_bucket_policy" "billing" {
  bucket = aws_s3_bucket.billing.id
  policy = data.aws_iam_policy_document.billing.json
}
