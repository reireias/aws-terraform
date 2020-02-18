resource "aws_s3_bucket" "factorio" {
  bucket = "factorio.timelapse"
  acl    = "public-read"

  website {
    index_document = "index.html"
  }

  tags = {
    Name = "factorio.timelapse"
  }
}

resource "aws_s3_bucket_policy" "factorio_policy" {
  bucket = aws_s3_bucket.factorio.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect":"Allow",
      "Principal": "*",
      "Action": ["s3:GetObject"],
      "Resource": ["arn:aws:s3:::factorio.timelapse/*"
      ]
    }
  ]
}
POLICY
}

resource "aws_s3_bucket" "billing" {
  bucket = "reireias-aws-billing"
  acl    = "private"

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
  bucket = "${aws_s3_bucket.billing.id}"
  policy = data.aws_iam_policy_document.billing.json
}
