

module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "9.10.0"
  create  = true
  tags    = local.common_tags

  name                       = "${local.name}-alb"
  load_balancer_type         = "application"
  vpc_id                     = module.vpc.vpc_id
  subnets                    = [module.vpc.public_subnets[0], module.vpc.public_subnets[1]]
  security_groups            = [module.loadbalancer_sg.security_group_id]
  enable_deletion_protection = false

  listeners = {
    ##Litener1
    my-http-https-redirect = {
      port     = 80
      protocol = "HTTP"

      redirect = {
        port        = "443"
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }

    } ## End of my-http-https-redirect

    ##Listener2
    my-https-listener = {
      port            = 443
      protocol        = "HTTPS"
      ssl_policy      = "ELBSecurityPolicy-TLS13-1-2-Res-2021-06"
      certificate_arn = module.acm.acm_certificate_arn

      # Fixed Response for Root Context 
      fixed_response = {
        content_type = "text/plain"
        message_body = "Fixed message"
        status_code  = "200"
      }

      rules = {
        myapp1-rule = {
          actions = [
            {
              type = "weighted-forward"
              target_groups = [
                {
                  target_group_key = "mytg1"
                  weight           = 1
                }
              ]
              stickiness = {
                enabled  = true
                duration = 3600
              }
            }
          ]

          conditions = [
            {
              host_header = {
                values = [var.app1_dns_name]
              }
            }
          ]

        } #End of myapp1 rule

        maypp2-rule = {
          actions = [
            {
              type = "weighted-forward"
              target_groups = [
                {
                  target_group_key = "mytg2"
                  weight           = 1
                }
              ]
              stickiness = {
                enabled  = true
                duration = 3600
              }
            }
          ]
          conditions = [
            {
              host_header = {
                values = [var.app2_dns_name]
              }
            }
          ]

        }
      }


    } ## End of my-https-listener
  }   ## End of listeners Block 

  target_groups = {
    mytg1 = {
      create_attachment                 = false
      name_prefix                       = "mytg1-"
      protocol                          = "HTTP"
      port                              = 80
      target_type                       = "instance"
      deregistration_delay              = 10
      load_balancing_cross_zone_enabled = false
      protocol_version                  = "HTTP1"


      health_check = {
        enabled             = true
        interval            = 30
        path                = "/app1/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }

      tags = local.common_tags
    } ## End of mytg1

    mytg2 = {
      create_attachment                 = false
      name_prefix                       = "mytg2-"
      protocol                          = "HTTP"
      port                              = 80
      target_type                       = "instance"
      deregistration_delay              = 10
      load_balancing_cross_zone_enabled = false
      protocol_version                  = "HTTP1"


      health_check = {
        enabled             = true
        interval            = 30
        path                = "/app2/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }

      tags = local.common_tags
    } ## End of mytg2
  }   ## End of Target Gorup 



} ## End of ALB module 

# Load Balancer Target Group Attachment
resource "aws_lb_target_group_attachment" "mytg1" {
  for_each         = { for k, v in module.ec2_private_app1 : k => v }
  target_group_arn = module.alb.target_groups["mytg1"].arn
  target_id        = each.value.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "mytg2" {
  for_each         = { for k, v in module.ec2_private_app2 : k => v }
  target_group_arn = module.alb.target_groups["mytg2"].arn
  target_id        = each.value.id
  port             = 80
}