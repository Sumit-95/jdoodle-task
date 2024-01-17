# Create SNS Topic for scaling and refresh alerts
resource "aws_sns_topic" "scaling_refresh_alerts" {
  name = "ScalingRefreshAlerts"
}

# Subscribe an email address to the SNS Topic
resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.scaling_refresh_alerts.arn
  protocol  = "email"
  endpoint  = "sharma.sumit1717@gmail.com"
}