# AWS EC2 Instance Terraform Variables
# EC2 Instance Variables
variable "instance_type" {
  type        = string
  description = "T2 Micro"
  default     = "t2.micro"

}

variable "instance_keypair" {
  type        = string
  description = "Key Pair to be used"
  default     = "terrform-key"

}

variable "private_instance_count" {
  description = "Instance Count in Private Subnets"
  type        = number
  default     = 1

}


