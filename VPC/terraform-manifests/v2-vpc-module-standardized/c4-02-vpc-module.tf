module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.9.0"
  # VPC Basic Details
  name            = "${local.name}-${var.vpc_name}"
  cidr            = var.vpc_cidr_block
  azs             = var.vpc_azs
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  ##DB Subnets
  create_database_subnet_group       = var.vpc_create_database_subnet_group
  create_database_subnet_route_table = var.vpc_create_database_subnet_route_table
  database_subnets                   = var.vpc_database_subnets

  # create_database_nat_gateway_route = true ## Means it will be deployed as private subnets and will access the internet via NATGW
  # create_database_internet_gateway_route = true  ## This means it will be public subnet and will access internet via IGW


  ##Single NAT Gateway - Outbound Communication to internet from private subnets
  enable_nat_gateway     = var.vpc_enable_nat_gateway
  single_nat_gateway     = var.vpc_single_nat_gateway
  one_nat_gateway_per_az = var.vpc_one_nat_gateway_per_az

  ## VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = local.common_tags

  ##VPC Tags
  vpc_tags = local.common_tags

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




}