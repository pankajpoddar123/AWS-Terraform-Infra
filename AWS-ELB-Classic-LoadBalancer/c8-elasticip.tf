resource "aws_eip" "bastion_eip" {
  depends_on = [module.vpc, module.ec2_public]
  tags       = local.common_tags
  instance   = module.ec2_public.id
  domain     = "vpc"

  provisioner "local-exec" {
    command     = "echo Destroy time prov `date` >> destroy-time-prov.txt"
    working_dir = "local-exec-output-files/"
    when        = destroy


  }

}

output "eip_ip" {
  description = "EIP IP Created"
  value       = aws_eip.bastion_eip.public_ip
}