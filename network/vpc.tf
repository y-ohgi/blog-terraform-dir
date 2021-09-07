resource "aws_vpc" "this" {
  cidr_block = local.workspace["cidr"]

  tags = local.tags
}
