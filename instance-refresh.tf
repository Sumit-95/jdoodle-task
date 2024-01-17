# Lambda function to perform instance refresh
resource "aws_lambda_function" "instance_refresh_lambda" {
  filename      = "lambda_function.zip"
  function_name = "instance_refresh_lambda"
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda_function.handler"
  runtime       = "python3.9"
}

# IAM Role for Lambda function
resource "aws_iam_role" "lambda_role" {
  name = "lambda_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# IAM Policy for Lambda function
resource "aws_iam_policy" "lambda_policy" {
  name        = "lambda_policy"
  description = "Policy for Lambda function"
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "autoscaling:StartInstanceRefresh",
      "Resource": "*"
    }
  ]
}
EOF
}

# Attach IAM policy to Lambda role
resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  policy_arn = aws_iam_policy.lambda_policy.arn
  role       = aws_iam_role.lambda_role.name
}

# Schedule event rule for daily refresh
resource "aws_cloudwatch_event_rule" "daily_refresh_event" {
  name                = "daily-refresh-event"
  schedule_expression = "cron(0 0 * * ? *)"
}

resource "aws_cloudwatch_event_target" "daily_refresh_target" {
  rule      = aws_cloudwatch_event_rule.daily_refresh_event.name
  target_id = "daily-refresh"
  arn       = aws_lambda_function.instance_refresh_lambda.arn
}
