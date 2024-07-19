##Instance Public IP
output "instance_publicip" {
  description = "EC2 Instance Public IP"
  value = [for instance in aws_instance.myec2vm: instance.public_ip]
}

output "instance_publicdns" {
  description = "EC2 Instance Public DNS"
  value = [for instance in aws_instance.myec2vm: instance.public_dns]
}

# EC2 Instance Public DNS with TOMAP
output "instance_publicdns2" {
  value = {for az, instance in aws_instance.myec2vm: az => instance.public_dns}
}