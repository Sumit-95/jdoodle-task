# Local Values
locals {
  vpc_name                 = "jdoodle-vpc"
  internet_gateway_name    = "jdoodle-internet-gateway"
  public_subnet_name       = "jdoodle-public-subnet"
  private_subnet_name      = "jdoodle-private-subnet"
  public_route_table_name  = "jdoodle-public-route-table"
  private_route_table_name = "jdoodle-private-route-table"
  elastic_ip_name          = "jdoodle-nat-elastic-ip"
  nat_gateway_name         = "jdoodle-nat-gateway"
  alb_security_group_name  = "jdoodle-alb-security-group"
  asg_security_group_name  = "jdoodle-asg-security-group"
  launch_template_name     = "jdoodle-launch-template"
  launch_template_ec2_name = "jdoodle-asg-ec2"
  alb_name                 = "jdoodle-external-alb"
  target_group_name        = "jdoodle-alb-target-group"
}