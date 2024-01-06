resource "aws_route_table_association" "public" {
  for_each = local.public_subnets
  subnet_id = each.value.id

  route_table_id = aws_route_table.public_route_table.id

}

resource "aws_route_table_association" "private" {
  for_each = local.private_subnets
  subnet_id = each.value.id

  route_table_id = aws_route_table.private_route_table.id
}