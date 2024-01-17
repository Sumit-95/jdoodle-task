######
# Create CloudWatch Alarms for load average
resource "aws_cloudwatch_metric_alarm" "scale_up_alarm" {
  alarm_name          = "scale-up-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "LoadAverage5min"
  namespace           = "AWS/EC2"
  period              = 300 # 5 minutes
  statistic           = "Average"
  threshold           = 75
  actions_enabled     = true
  alarm_actions       = [aws_autoscaling_policy.scale_up_policy.arn, aws_sns_topic.scaling_refresh_alerts.arn]
}

resource "aws_cloudwatch_metric_alarm" "scale_down_alarm" {
  alarm_name          = "scale-down-alarm"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "LoadAverage5min"
  namespace           = "AWS/EC2"
  period              = 300 # 5 minutes
  statistic           = "Average"
  threshold           = 50
  actions_enabled     = true
  alarm_actions       = [aws_autoscaling_policy.scale_down_policy.arn, aws_sns_topic.scaling_refresh_alerts.arn]
}
