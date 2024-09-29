data "aws_availability_zones" "main" {
  state = "available"
}

# data "aws_ssm_parameter" "import" {
#   name = "/${var.project_name}/${var.environment}/vpc_id"
# }
data "aws_vpc" "default" {
    default = true
}
data "aws_route_table" "main" {
  vpc_id = local.default_vpc 
  filter {
    name = "association.main"
    values = ["true"]
  }
}