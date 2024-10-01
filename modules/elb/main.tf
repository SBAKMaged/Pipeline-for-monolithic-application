resource "aws_elb" "this" {
  name               = "my-elb"
  security_groups    = [var.security_group_id]
  subnets            = var.subnets

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  tags = {
    Name = "MyELB"
  }
}