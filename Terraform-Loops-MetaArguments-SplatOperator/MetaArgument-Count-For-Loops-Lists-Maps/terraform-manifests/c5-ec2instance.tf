resource "aws_instance" "myec2vm" {
  ami           = data.aws_ami.amzlinux2.id
  instance_type = var.instance_type
  #instance_type          = var.instance_type_list[0] ## To use list type variable
  #instance_type          = var.instance_type_map["qa"] ## To use map type variable
  user_data              = file("${path.module}/app1-install.sh")
  key_name               = var.instance_keypair
  vpc_security_group_ids = [aws_security_group.vpc-ssh-22-80-443.id]
  count                  = 2
  tags = {
    #"Name" = "VM-${var.instance_type_list[0]}"
    #"Name" = "VM-${var.instance_type_map["qa"]}"
    "Name" = "VM-${count.index}"
  }

}

