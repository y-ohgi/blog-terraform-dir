#########################
# Public Subnet
#########################
resource "aws_subnet" "public" {
  count = length(local.workspace["public_subnets"])

  vpc_id = aws_vpc.this.id

  cidr_block        = element(local.workspace["public_subnets"], count.index)
  availability_zone = element(local.workspace["azs"], count.index)

  tags = merge(
    local.tags,
    { "Name" = format("%s-public-%d", local.name, count.index) }
  )
}

#########################
# Private Subnet
#########################
resource "aws_subnet" "private" {
  count = length(local.workspace["private_subnets"])

  vpc_id = aws_vpc.this.id

  cidr_block        = element(local.workspace["private_subnets"], count.index)
  availability_zone = element(local.workspace["azs"], count.index)

  tags = merge(
    local.tags,
    { "Name" = format("%s-private-%d", local.name, count.index) }
  )
}
