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
