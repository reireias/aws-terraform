resource "aws_s3_bucket" "billing" {
  bucket = "reireias-billing"
  acl    = "private"

  tags = {
    Name        = "reireias-billing"
  }
}

resource "aws_s3_bucket_policy" "billing" {
  bucket = "${aws_s3_bucket.billing.id}"

  policy = <<POLICY
{
  "Version": "2008-10-17",
  "Id": "Policy1335892530063",
  "Statement": [
    {
      "Sid": "Stmt1335892150622",
      "Effect": "Allow",
      "Principal": {
        "Service": "billingreports.amazonaws.com"
      },
      "Action": [
        "s3:GetBucketAcl",
        "s3:GetBucketPolicy"
      ],
      "Resource": "arn:aws:s3:::reireias-billing"
    },
    {
      "Sid": "Stmt1335892526596",
      "Effect": "Allow",
      "Principal": {
        "Service": "billingreports.amazonaws.com"
      },
      "Action": "s3:PutObject",
      "Resource": "arn:aws:s3:::reireias-billing/*"
    },
    {
      "Sid": "BillingBucketUser",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::551198746745:user/billing-bucket"
      },
      "Action": [
        "s3:GetObject"
      ],
      "Resource": "arn:aws:s3:::reireias-billing/*"
    }
  ]
}
POLICY
}
