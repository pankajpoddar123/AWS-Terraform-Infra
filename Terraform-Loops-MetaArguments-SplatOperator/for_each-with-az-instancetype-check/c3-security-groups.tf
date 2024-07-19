resource "aws_security_group" "vpc-ssh-22-80-443" {
  name        = "allow-22-80-443"
  description = "Allow 80 22 and 443"
  tags = {
    Name = "allow_22_80_443"
  }

}

resource "aws_vpc_security_group_ingress_rule" "allow_22_80_443" {
  for_each          = toset(["22", "80", "443"])
  security_group_id = aws_security_group.vpc-ssh-22-80-443.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = tonumber(each.key)
  ip_protocol       = "tcp"
  to_port           = tonumber(each.key)
}

resource "aws_vpc_security_group_egress_rule" "allow_all" {
  security_group_id = aws_security_group.vpc-ssh-22-80-443.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"

}

