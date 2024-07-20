module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.9.0"
  # VPC Basic Details
  name            = "vpc-dev"
  cidr            = "10.0.0.0/16"
  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  ##DB Subnets
  create_database_subnet_group       = true
  create_database_subnet_route_table = true
  database_subnets                   = ["10.0.151.0/24", "10.0.152.0/24"]

  # create_database_nat_gateway_route = true ## Means it will be deployed as private subnets and will access the internet via NATGW
  # create_database_internet_gateway_route = true  ## This means it will be public subnet and will access internet via IGW


  ##Single NAT Gateway - Outbound Communication to internet from private subnets
  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  ## VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support   = true

  ##Public Subnet Tags
  public_subnet_tags = {
    Type = "public-subnets"
  }

  ##Private Subnet Tags
  private_subnet_tags = {
    Type = "private-subnets"
  }

  ##DB Subnet Tags

  database_subnet_tags = {
    Type = "database-subnets"
  }

  ## Tags will be added to all resources
  tags = {
    Owner       = "Pankaj"
    Environment = "dev"
  }

  ##VPC Tags
  vpc_tags = {
    Name = "vpc-dev"
  }
}