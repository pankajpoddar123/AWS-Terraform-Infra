# DNS Registration 
resource "aws_route53_record" "default_dns" {
  zone_id = data.aws_route53_zone.mydomain.zone_id
  name    = "dns-to-db.learncloudeasy.com"
  type    = "A"
  alias {
    #name                   = module.alb.this_lb_dns_name
    #zone_id                = module.alb.this_lb_zone_id
    name                   = module.alb.dns_name
    zone_id                = module.alb.zone_id
    evaluate_target_health = true
  }
}

/*

resource "aws_route53_record" "app1_dns" {
  zone_id = data.aws_route53_zone.mydomain.zone_id
  name    = "aws-labs.learncloudeasy.com"
  type    = "A"
  alias {
    name                   = module.alb.dns_name
    zone_id                = module.alb.zone_id
    evaluate_target_health = true
  }
}

output "mydomainname" {
  description = "Domain Name to Query"
  value       = aws_route53_record.default_dns.name

}

output "customhostheader" {
  description = "custom host header"
  value       = aws_route53_record.app1_dns.name
}

*/