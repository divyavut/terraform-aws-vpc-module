locals {
    resource_name = "${var.project_name}-${var.environment}"
    az_names = slice(data.aws_availability_zones.main.names, 0, 2) 
    default_vpc = data.aws_vpc.default.id
}