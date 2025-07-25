# modules/alb/main.tf
resource "aws_lb" "this" {
  name               = var.alb_name
  load_balancer_type = "application"
  internal           = false
  ip_address_type    = "ipv4"
  security_groups    = var.security_groups
  subnets            = var.public_subnets

  tags = {
    Name = var.alb_name
  }
}

resource "aws_lb_listener" "https" {
  count             = var.enable_acm ? 1 : 0
  load_balancer_arn = aws_lb.this.arn
  port              = 443
  protocol          = "HTTPS"

  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.acm_certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = var.target_group_arn
  }
}
