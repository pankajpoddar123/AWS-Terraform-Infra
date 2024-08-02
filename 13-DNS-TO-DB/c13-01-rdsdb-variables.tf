

# DB Name
variable "db_name" {
  description = "AWS RDS DB Instance Name"
  type        = string

}

variable "db_instance_identifier" {
  description = "AWS RDS DB Instance Identifier"
  type        = string

}

variable "db_username" {
  description = "AWS RDS DB Administrtor Password"
  type        = string

}

variable "db_password" {
  description = "AWS RDS Database Administrator Password"
  type        = string
  sensitive   = true

}


