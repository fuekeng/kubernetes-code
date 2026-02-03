resource "aws_cloudwatch_log_group" "log" {
  name              = var.log_group_name
  retention_in_days = 30
}