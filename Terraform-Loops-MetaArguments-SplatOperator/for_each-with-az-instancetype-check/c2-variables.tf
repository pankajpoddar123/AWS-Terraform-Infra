variable "aws_region" {
  type        = string
  description = "AWS Region"
  default     = "us-east-1"

}

variable "instance_type" {
  type        = string
  description = "Ec2 Install Type "
  default     = "t3.micro"

}

variable "instance_keypair" {
  type        = string
  description = "AWS Ec2 Instance KeyPair"
  default     = "terraform-key"


}

