resource "aws_vpc_peering_connection" "peering" {
  count = var.ispeering_required ? 1 : 0
  peer_vpc_id   = local.default_vpc # acceptor (default vpc)
  vpc_id        = aws_vpc.main.id # requestor
  auto_accept   = true

  tags = {
    Name = "${local.resource_name}-default"
  }
}

resource "aws_route" "default_peering" {
   count = var.ispeering_required ? 1: 0
  route_table_id            = data.aws_route_table.main.id # acceptor 
  destination_cidr_block    = var.vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[count.index].id
}
resource "aws_route" "public_peering" {
   count = var.ispeering_required ? 1: 0
  route_table_id            = aws_route_table.public.id # requestor 
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[count.index].id
}
resource "aws_route" "private_peering" {
   count = var.ispeering_required ? 1: 0
  route_table_id            = aws_route_table.private.id # requestor 
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[count.index].id
}
resource "aws_route" "database_peering" {
   count = var.ispeering_required ? 1: 0
  route_table_id            = aws_route_table.database.id # requestor 
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[count.index].id
}
