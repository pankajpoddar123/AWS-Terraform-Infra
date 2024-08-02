data "aws_ami" "amzlinux2" {
  most_recent = true
  name_regex  = "^al2023-ami*"


  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  }

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
  filter {
    name   = "root-device-name"
    values = ["/dev/xvda"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "is-public"
    values = ["true"]
  }
}

output "ami_id" {
  description = "AMI ID Returned"
  value       = data.aws_ami.amzlinux2.image_id

}