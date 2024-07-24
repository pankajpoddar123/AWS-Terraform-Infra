##VPC Input variables
variable "vpc_name" {
  type        = string
  description = "VPC Name"
  default     = "myvpc"

}

## VPC CIDR BLOCK

variable "vpc_cidr_block" {
  type        = string
  description = "VPC CIDR Block"
  default     = "10.0.0.0/16"

}

## VPC AZ's

variable "vpc_azs" {
  type        = list(string)
  description = "VPC AZ's where subnets needs to be created"
  default     = ["us-east-1a", "us-east-1b"]

}

## VPC Public Subnets
variable "vpc_public_subnets" {
  type        = list(string)
  description = "VPC Public Subnets"
  default     = ["10.0.101.0/24", "10.0.102.0/24"]

}

## VPC Private Subnets
variable "vpc_private_subnets" {
  type        = list(string)
  description = "VPC Private Subnets"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]

}

# VPC Database Subnets
variable "vpc_database_subnets" {
  description = "VPC Database Subnets"
  type        = list(string)
  default     = ["10.0.151.0/24", "10.0.152.0/24"]
}


## Create DB Subnet Group (True/False)
variable "vpc_create_database_subnet_group" {
  description = "Create DB Subnet Group (True/False)"
  type        = bool
  default     = true
}

## Create DB Subnet Route Table
variable "vpc_create_database_subnet_route_table" {
  description = "Create DB Subnet Route Table"
  type        = bool
  default     = true
}


##Enable VPC NAT Gateway
variable "vpc_enable_nat_gateway" {
  description = "Enable NAT for VPC"
  type        = bool
  default     = true

}

## Create a single NAT Gateway for the entire VPC
variable "vpc_single_nat_gateway" {
  description = "Create a single NAT Gateway for the entire VPC"
  type        = bool
  default     = true

}

##Do you want  one NAT Per AZ 
variable "vpc_one_nat_gateway_per_az" {
  description = "Do you want  one NAT Per AZ "
  type        = bool
  default     = false

}


