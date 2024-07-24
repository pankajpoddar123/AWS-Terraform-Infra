module "ec2_private_app2" {
  for_each   = toset(["0", "1"])
  depends_on = [module.vpc] ## Else userdata webserver provisioning will fail
  source     = "terraform-aws-modules/ec2-instance/aws"
  version    = "5.6.1"

  name                   = "${var.environment}-app2"
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  vpc_security_group_ids = [module.private_sg.security_group_id]
  subnet_id              = element(module.vpc.private_subnets, tonumber(each.key))
  user_data              = file("${path.module}/app2-install.sh")

  tags = local.common_tags
}

