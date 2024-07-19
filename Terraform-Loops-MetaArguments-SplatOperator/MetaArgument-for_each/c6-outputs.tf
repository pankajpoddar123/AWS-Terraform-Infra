output "instance_publicip" {
  value = toset([for instance in aws_instance.myec2vm : instance.public_ip])
}

output "instance_publicdns" {
  value = [for instance in aws_instance.myec2vm : instance.public_dns]
}

##Here key used in for_each is availabliy zones  name so in output az will change to az names 
## If the loop was count then az would have replaced to numbers 0 1 2 etc 
output "instance_publicdns2" {
  value = { for az, instance in aws_instance.myec2vm : az => instance.public_dns }

}


