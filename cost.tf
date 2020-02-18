resource "aws_cur_report_definition" "report" {
  provider = aws.use1

  report_name                = "billing"
  time_unit                  = "DAILY"
  format                     = "textORcsv"
  compression                = "GZIP"
  additional_schema_elements = []
  s3_bucket                  = aws_s3_bucket.billing.id
  s3_region                  = "ap-northeast-1"
  additional_artifacts       = []
}
