
##AWS Region 
variable "aws_region" {
  type        = string
  description = "AWS Region"
  default     = "us-east-1"

}

##Environment Variable
variable "environment" {
  description = "Environment variable used as prefix"
  type        = string
  default     = "dev"

}

##Business Division
variable "business_divison" {
  description = "Business Division for the orgainization"
  type        = string
  default     = "SAP"

}

