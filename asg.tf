# ASG Resources
resource "aws_autoscaling_group" "auto_scaling_group" {
  name                = "doodle-asg"
  desired_capacity    = var.desired_capacity
  max_size            = var.max_size
  min_size            = var.min_size
  vpc_zone_identifier = [for i in aws_subnet.private_subnet[*] : i.id]
  target_group_arns   = [aws_lb_target_group.target_group.arn]

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = aws_launch_template.launch_template.latest_version
  }
}
