
module "ec2_private_app3" {
  for_each   = toset(["0", "1"])
  depends_on = [module.vpc] ## Else userdata webserver provisioning will fail
  source     = "terraform-aws-modules/ec2-instance/aws"
  version    = "5.6.1"

  name                   = "${var.environment}-app3"
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  vpc_security_group_ids = [module.private_sg.security_group_id]
  subnet_id              = element(module.vpc.private_subnets, tonumber(each.key))

  user_data = templatefile("app3-ums-install.tmpl", { rds_db_endpoint = module.rdsdb.db_instance_address })

  tags = local.common_tags
}

