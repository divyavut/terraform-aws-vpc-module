## create a Expense VPC  
 create a vpc with following resources.Application in vpc should provide High Availability

 * create VPC named as : (project_name-environmnet)
 * create IternetGateway and attach it to vpc 
 * create two public subnet as : (project_name-environment-public-us-east-1a),(project_name-environment-public-us-east-1b)
 * create two private subnet as : (project_name-environment-private- us-east-1a),
 (project_name-environment-private- us-east-1b)
 * create two database subnet as : (project_name-environment-database-us-east-1a),
 (project_name-environment-database-us-east-1b)
 * create Elastic-Ip as (project_name-environment)
 * Create NAT Gateway in public Subnet as: (project_name-environment)
 * create public route table as: (project_name-environment-public)
 * create private route table as : (project_name-environment-private)
 * create database route table as : (project_name-environment-database)
 * Add Internet route to public route table 
 * Add NAT route to private route table 
 * Add NAT route to database route table 
 * pulbic Route Table Association with public subnet
 * private Route Table Association with private subnet
 * Database Route Table Association with database subnet

 ## Create a Expense VPC peering with Default VPC

 * Create a VPC peering with default vpc
 * Expense VPC : Requestor
 * Default VPC: Acceptor
 * Add Expense VPC CIDR as route in Default VPC route table(Acceptor) 
 * Add Default VPC CIDR as route in Expense VPC route table(Requestor) 

 ### Inputs for Expense VPC 
 * project_name(Mandatory): User should supply the project_name while calling vpc module
 * environment(Mandatory): User should supply the environment while calling vpc module
 * vpc_cidr(Mandatory): User should supply the vpc_cidr while calling vpc module
 * public_subnet_cidr(Mandatory): User should supply list(string) of cidrs while calling vpc module
 * private_subnet_cidr(Mandatory): User should supply list(string) of cidrs while calling vpc module
 * database_subnet_cidr(Mandatory): User should supply list(string) of cidrs while calling vpc module
 * ispeering_required: default false 

 ### outputs
  * vpc_id --  Ganerated VPC id from vpc module