## Bastion SG OUTPUT

output "public_bastion_sg_security_group_id" {
  description = "The ID of the Bastion security group"
  value       = module.public_bastion_sg.security_group_id
}

output "public_bastion_sg_security_group_name" {
  description = "The name of the Bastion security group"
  value       = module.public_bastion_sg.security_group_name
}

output "public_bastion_sg_security_group_vpc_id" {
  description = "The VPC ID of the Bastion SG "
  value       = module.public_bastion_sg.security_group_vpc_id
}


##Private SG OUTOUT
output "private_sg_security_group_id" {
  description = "The ID of the Priivate security group"
  value       = module.private_sg.security_group_id
}

output "private_sg_security_group_name" {
  description = "The name of the Private security group"
  value       = module.private_sg.security_group_name
}

output "private_sg_security_group_vpc_id" {
  description = "The VPC ID of the Private SG "
  value       = module.private_sg.security_group_vpc_id
}


## LoadBalancer SG Output

##Private SG OUTOUT
output "loadbalancer_sg_security_group_id" {
  description = "The ID of the LoadBalancer security group"
  value       = module.loadbalancer_sg.security_group_id
}

output "loadbalancer_sg_security_group_name" {
  description = "The name of the CLB security group"
  value       = module.loadbalancer_sg.security_group_name
}

output "loadbalancer_sg_security_group_vpc_id" {
  description = "The VPC ID of the Private SG "
  value       = module.loadbalancer_sg.security_group_vpc_id
}
