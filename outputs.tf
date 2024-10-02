
output "vpc_id" {
    value = aws_vpc.main.id
}

# output the data sources of az's for full content
# output "az_info" {
#  value = data.aws_availability_zones.main
# }

# Use splat expression to get all subnet IDs
output "public_subnet_ids" {
    value = aws_subnet.public[*].id
}
output "private_subnet_ids" {
    value = aws_subnet.private[*].id
}
output "database_subnet_ids" {
    value = aws_subnet.database[*].id
}

output "expense_cidr" {
    value = aws_vpc.main.cidr_block
}
# output "parameter_store" {
#     value = data.aws_ssm_parameter.import

# output the data sources of default vpc for full content
# output "vpc_info" {
#     value = data.aws_vpc.default
# }
output "default_vpc_id" {
    value = data.aws_vpc.default.id
}
# output "default_rt_info" {
#     value = data.aws_route_table.main
# }

output "database_subnet_group_name" {
    value = aws_db_subnet_group.default.name
}
