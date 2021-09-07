#########################
# Private Route Table
#########################
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  tags = merge(
    local.tags,
    { "Name" = format("%s-public", local.name) }
  )
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = local.tags
}

resource "aws_route" "public_internet_gateway" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
}

resource "aws_route_table_association" "public" {
  count = length(local.workspace["public_subnets"])

  route_table_id = aws_route_table.public.id
  subnet_id      = element(aws_subnet.public.*.id, count.index)

  depends_on = [
    aws_subnet.public
  ]
}


#########################
# Private Route Table
#########################
resource "aws_route_table" "private" {
  count = length(local.workspace["private_subnets"])

  vpc_id = aws_vpc.this.id

  tags = merge(
    local.tags,
    { "Name" = format("%s-private-%d", local.name, count.index) }
  )
}

resource "aws_route_table_association" "private" {
  count = length(local.workspace["private_subnets"])

  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = element(aws_route_table.private.*.id, count.index)
}

resource "aws_route" "private_nat_gateway" {
  count = length(local.workspace["private_subnets"])

  route_table_id         = element(aws_route_table.private.*.id, count.index)
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = element(aws_nat_gateway.this.*.id, count.index)
}


resource "aws_eip" "nat" {
  count = length(local.workspace["private_subnets"])

  vpc = true

  tags = merge(
    local.tags,
    { "Name" = format("%s-%d", local.name, count.index) }
  )
}

resource "aws_nat_gateway" "this" {
  count = length(local.workspace["private_subnets"])

  allocation_id = element(aws_eip.nat.*.id, count.index)
  subnet_id     = element(aws_subnet.public.*.id, count.index)

  tags = merge(
    local.tags,
    { "Name" = format("%s-%d", local.name, count.index) }
  )

  depends_on = [
    aws_eip.nat,
    aws_subnet.public
  ]
}

