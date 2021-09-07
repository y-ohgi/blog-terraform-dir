resource "aws_security_group" "this" {
  vpc_id = var.vpc_id
  name   = var.name

  description = var.name

  tags = merge(
    var.tags,
    { "Name" = var.name }
  )
}

#########################
# Ingress Rule
#########################
resource "aws_security_group_rule" "ingress" {
  count = length(var.ingress_cidr_blocks)

  type = "ingress"

  security_group_id = aws_security_group.this.id

  cidr_blocks = split(",", lookup(var.ingress_cidr_blocks[count.index], "cidr_blocks"))

  from_port   = lookup(var.ingress_cidr_blocks[count.index], "port")
  to_port     = lookup(var.ingress_cidr_blocks[count.index], "port")
  protocol    = "tcp"
  description = var.name
}

resource "aws_security_group_rule" "ingress_with_security_group" {
  count = length(var.ingress_with_security_group_rules)

  type = "ingress"

  security_group_id = aws_security_group.this.id

  source_security_group_id = lookup(var.ingress_with_security_group_rules[count.index], "source_security_group_id")

  from_port   = lookup(var.ingress_with_security_group_rules[count.index], "port")
  to_port     = lookup(var.ingress_with_security_group_rules[count.index], "port")
  protocol    = "tcp"
  description = var.name
}

#########################
# Egress Rule
#########################
resource "aws_security_group_rule" "egress" {
  type = "egress"

  security_group_id = aws_security_group.this.id

  cidr_blocks = var.egress_cidr_blocks

  from_port = 0
  to_port   = 0
  protocol  = "-1"
}
