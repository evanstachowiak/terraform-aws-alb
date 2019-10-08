locals {
  security_group_description = "${var.security_group_description == "" ? format("%s alb security group", var.load_balancer_name) : var.security_group_description}"

  target_groups_default_configs = {
    cookie_duration                  = 86400
    deregistration_delay             = 300
    health_check_interval            = 10
    health_check_healthy_threshold   = 3
    health_check_path                = "/"
    health_check_port                = "traffic-port"
    health_check_timeout             = 5
    health_check_unhealthy_threshold = 3
    health_check_matcher             = "200-299"
    stickiness_enabled               = true
    target_type                      = "instance"
    slow_start                       = 0
  }

  target_groups_defaults = "${merge(local.target_groups_default_configs, var.target_groups_defaults)}"
}
