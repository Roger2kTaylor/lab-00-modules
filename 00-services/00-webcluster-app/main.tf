# ////////////////////////////////////////////
# RESOURCES
# ////////////////////////////////////////////

# ASG Launch Configuration
resource "aws_launch_configuration" "launch_config" {
  image_id        = "ami-0d8d212151031f51c"
  instance_type   = var.instance_type
  security_groups = [aws_security_group.instance.id]
  key_name        = "lab"

  name = "${var.cluster_name}-asg-lc"

  # User Data for ASG EC2 Instances
  user_data = data.template_file.user_data.rendered

  # Required when using a launch configuration with an auto scaling group.
  # https://www.terraform.io/docs/providers/aws/r/launch_configuration.html
  lifecycle {
    create_before_destroy = true
  }

}

# AWS AutoScaling Group
resource "aws_autoscaling_group" "as_group" {
  launch_configuration = aws_launch_configuration.launch_config.name
  vpc_zone_identifier  = data.aws_subnet_ids.default.ids

  name = "${var.cluster_name}-asg"

  # Target Group ARNs
  target_group_arns = [aws_lb_target_group.asg.arn]
  health_check_type = "ELB"

  # AutoScaling Group size
  min_size = var.min_size
  max_size = var.max_size

  tag {
    key                 = "Name"
    value               = "${var.cluster_name}-asg"
    propagate_at_launch = true
  }

}

