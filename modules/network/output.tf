output "main_vpc_id" {
  value = aws_vpc.main.id
}

output "main_subnet_id" {
  value = aws_subnet.main.id
}

output "main_internet_gateway_id" {
  value = aws_internet_gateway.main.id
}

output "main_route_table_id" {
  value = aws_route_table.main.id
}