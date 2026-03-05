resource "aws_vpc" "vpc121" {
  cidr_block                       = var.vpc_cidr
  assign_generated_ipv6_cidr_block = false
  tags = {
    Name = var.vpc_tag
  }
}

resource "aws_subnet" "publicsub" {
  for_each                = toset(var.public_subnet_cidrs)
  vpc_id                  = aws_vpc.vpc121.id
  cidr_block              = each.value
  availability_zone       = element(["us-east-1a", "us-east-1b"], index(var.public_subnet_cidrs, each.value))
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.pubsub_name}-${each.key}"
  }
}

resource "aws_subnet" "prvsb" {
  for_each          = toset(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.vpc121.id
  cidr_block        = each.value
  availability_zone = element(["us-east-1a", "us-east-1b"], index(var.private_subnet_cidrs, each.value))
  tags = {
    Name = "${var.privsub_name}-${each.key}"
  }
}

resource "aws_internet_gateway" "igwwww" {
  vpc_id = aws_vpc.vpc121.id
  tags = {
    Name = var.igw_name
  }
}

resource "aws_eip" "nat" {
  for_each = aws_subnet.publicsub
  tags = {
    Name = "nat-eip-${each.key}"
  }
}

resource "aws_nat_gateway" "nat_gw" {
  for_each      = aws_subnet.publicsub
  allocation_id = aws_eip.nat[each.key].id
  subnet_id     = each.value.id
  tags = {
    Name = "nat-${each.key}"
  }
}

resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.vpc121.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igwwww.id
  }
  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table" "priv_rt" {
  for_each = aws_subnet.prvsb
  vpc_id   = aws_vpc.vpc121.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = values(aws_nat_gateway.nat_gw)[0].id
  }

  tags = {
    Name = "private-rt-${each.key}"
  }
}

resource "aws_route_table_association" "pub_assoc" {
  for_each       = aws_subnet.publicsub
  subnet_id      = each.value.id
  route_table_id = aws_route_table.pub_rt.id
}

resource "aws_route_table_association" "priv_assoc" {
  for_each       = aws_subnet.prvsb
  subnet_id      = each.value.id
  route_table_id = aws_route_table.priv_rt[each.key].id
}
