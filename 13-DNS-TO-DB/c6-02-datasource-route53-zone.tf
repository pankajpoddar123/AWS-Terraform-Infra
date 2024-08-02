data "aws_route53_zone" "mydomain" {
  name = "learncloudeasy.com"

}

output "mydomain_zoneid" {
  description = "The hosted zone id of the desired hosted zone"
  value       = data.aws_route53_zone.mydomain.zone_id

}

output "mydomain_name" {
  description = "The Hosted Zone name."
  value       = data.aws_route53_zone.mydomain.name

}