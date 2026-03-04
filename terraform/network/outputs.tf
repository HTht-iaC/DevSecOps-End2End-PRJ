output "vpc_id" {
  value = aws_vpc.vpc121.id
}

output "public_subnet_ids" {
  value = [for s in aws_subnet.publicsub : s.id]
}

output "private_subnet_ids" {
  value = [for s in aws_subnet.prvsb : s.id]
}

output "nat_gateway_ips" {
  value = { for k, v in aws_eip.nat : k => v.public_ip }
}

output "igw_id" {
  value = aws_internet_gateway.igwwww.id
}

output "public_route_table_id" {
  value = aws_route_table.pub_rt.id
}

output "private_route_table_ids" {
  value = { for k, v in aws_route_table.priv_rt : k => v.id }
}
