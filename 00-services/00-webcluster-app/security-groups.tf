# ////////////////////////////////////////////
# RESOURCES
# ////////////////////////////////////////////

# Module local Variables
# Only accessible within the module
locals {
  http_port    = 80
  ssh_port     = 22
  any_port     = 0
  any_protocol = "-1"
  tcp_protocol = "tcp"
  all_ips      = ["0.0.0.0/0"]
}

# Web Server Security Group
resource "aws_security_group" "instance" {
  name = "${var.cluster_name}-instance-sg"
}

# Security Group Rule - Allow HTTP Inbound
resource "aws_security_group_rule" "allow_http_inbound_instance" {
  type              = "ingress"
  security_group_id = aws_security_group.instance.id
  from_port         = local.http_port
  to_port           = local.http_port
  protocol          = local.tcp_protocol
  cidr_blocks       = local.all_ips
}

# Security Group Rule - Allow SSH Inbound
resource "aws_security_group_rule" "allow_ssh_inbound_instance" {
  type              = "ingress"
  security_group_id = aws_security_group.instance.id
  from_port         = local.ssh_port
  to_port           = local.ssh_port
  protocol          = local.tcp_protocol
  cidr_blocks       = local.all_ips
}

# Security Group Rule - Allow all traffic Outbound
resource "aws_security_group_rule" "allow_all_outbound_instance" {
  type              = "egress"
  security_group_id = aws_security_group.instance.id
  from_port         = local.any_port
  to_port           = local.any_port
  protocol          = local.any_protocol
  cidr_blocks       = local.all_ips
}

# Web Server ALB Security Group
resource "aws_security_group" "alb" {
  name = "${var.cluster_name}-alb-sg"
}

# Security Group Rule - Allow HTTP Inbound
resource "aws_security_group_rule" "allow_http_inbound_alb" {
  type              = "ingress"
  security_group_id = aws_security_group.alb.id
  from_port         = local.http_port
  to_port           = local.http_port
  protocol          = local.tcp_protocol
  cidr_blocks       = local.all_ips
}

# Security Group Rule - Allow all traffic Outbound
resource "aws_security_group_rule" "allow_all_outbound_alb" {
  type              = "egress"
  security_group_id = aws_security_group.alb.id
  from_port         = local.any_port
  to_port           = local.any_port
  protocol          = local.any_protocol
  cidr_blocks       = local.all_ips
}



