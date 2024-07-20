###Define local values in Terraform
##Advantage of local value we can also use expression
locals {
  owners      = var.business_divison ##We can refer a variable in locals
  environment = var.environment
  #name = "${local.owners}-${local.environment}" 
  name = "${var.business_divison}-${var.environment}"
  common_tags = {
    owners      = local.owners
    environment = local.environment
  }
}