variable  "vpc_cidr" {
  type        = string
}
variable  "project_name" {
  type        = string
}
variable  "environment" {
  type        = string
}
variable "enable_dns_hostnames" {
  type = string
}
variable "public_subnet_cidr_block" {
  type =  list(string)
   validation {
        condition = length(var.public_subnet_cidr_block) == 2
        error_message = "Please provide only two cidr list values "
    } 
}
variable "private_subnet_cidr_block" {
  type =  list(string)
   validation {
        condition = length(var.private_subnet_cidr_block) == 2
        error_message = "Please provide only two cidr list values "
    }
}
variable "database_subnet_cidr_block" {
  type =  list(string)
   validation {
        condition = length(var.database_subnet_cidr_block) == 2
        error_message = "Please provide only two cidr list values "
    }
}

variable "common_tags" {
  type = map(string)
  default = { }
}
variable "vpc_tags" {
  type = map(string)
  default = { }
}
variable "ispeering_required" {
  type = bool
  default = false
}