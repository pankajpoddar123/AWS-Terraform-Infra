output "for_output_list" {
  description = "For loop with list"
  value       = [for instance in aws_instance.myec2vm : instance.public_dns]

}

output "for_output_map" {
  description = "For loop with map"
  value       = { for instance in aws_instance.myec2vm : instance.id => instance.public_dns }
}


output "for_output_map2" {
  description = "For loop with Map - Advanced"
  value       = { for c, instance in aws_instance.myec2vm : c => instance.public_dns }
}

/*
This is how we get the output of above 
for_output_map2 = {
  "0" = "ec2-44-201-104-151.compute-1.amazonaws.com" 
  "1" = "ec2-52-203-39-221.compute-1.amazonaws.com"
}
*/

output "legacy_splat_instance_publicdns" {
  value       = aws_instance.myec2vm.*.public_dns
  description = "Ec2 Instance Public IP"

}

output "latest_splat_publicdns" {
  value       = aws_instance.myec2vm[*].public_dns
  description = "Ec2 Instance Public DNS"

}

