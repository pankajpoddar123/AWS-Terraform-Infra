resource "aws_instance" "myec2vm" {
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  user_data              = file("${path.module}/app1-install.sh")
  key_name               = var.instance_keypair
  vpc_security_group_ids = [aws_security_group.vpc-ssh-22-80-443.id]
  tags = {
    "Name" = "Ec2 Demo"
  }

}

