## Securtity Group for Bastation Host 
module "loadbalancer_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"

  name        = "loadbalancer_sg"
  description = "SG with port 80 and 81 egress ports are all world open"
  vpc_id      = module.vpc.vpc_id

  ## Ingree Rules
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp"]

  ##Egree Rules
  egress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules       = ["all-all"]

  tags = local.common_tags
  # Open to CIDRs blocks (rule or from_port+to_port+protocol+description)
  ingress_with_cidr_blocks = [
    {
      from_port   = 81
      to_port     = 81
      protocol    = 6 ## The most common protocols are 6 (TCP), 17 (UDP), and 1 (ICMP).
      description = "Allow 81 port from interner"
      cidr_blocks = "0.0.0.0/0"
    },

  ]
}
