resource "aws_launch_configuration" "this" {
  name_prefix          = var.launch_configuration_name
  image_id             = var.ami_id
  instance_type        = var.instance_type
  key_name             = var.key_name
  security_groups      = var.security_group_ids

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "this" {
  name                      = "my-asg"
  launch_configuration      = aws_launch_configuration.this.name
  min_size                  = var.min_size
  max_size                  = var.max_size
  desired_capacity          = var.desired_capacity
  vpc_zone_identifier       = var.subnet_ids
  load_balancers            = [var.elb_name]
  health_check_type         = "ELB"
  health_check_grace_period = 300

  tag {
    key                 = "Name"
    value               = "Autoscaling-EC2"
    propagate_at_launch = true
  }

  force_delete = true
}