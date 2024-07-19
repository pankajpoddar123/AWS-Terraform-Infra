variable "aws_region" {
  type        = string
  description = "AWS Region"
  default     = "us-east-1"

}

variable "instance_type" {
  type        = string
  description = "Ec2 Install Type "
  default     = "t2.micro"

}

variable "instance_keypair" {
  type        = string
  description = "AWS Ec2 Instance KeyPair"
  default     = "terraform-key"


}

variable "instance_type_list" {
  type        = list(string)
  description = "Ec2 Instance Types"
  default     = ["t3.micro", "t3.small", "t3.large"]

}

variable "instance_type_map" {
  type        = map(string)
  description = "Ec2 Instance Type"
  default = {
    "dev"  = "t3.micro"
    "qa"   = "t3.small"
    "prod" = "t3.large"
  }

}