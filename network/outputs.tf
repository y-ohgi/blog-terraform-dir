output "vpc_id" {
  value = aws_vpc.this.id
}

output "vpc_cidr" {
  value = aws_vpc.this.cidr_block
}

output "public_subnet_ids" {
  value = aws_subnet.public.*.id
}

output "private_subnet_ids" {
  value = aws_subnet.private.*.id
}

output "public_subnet_cidrs" {
  value = aws_subnet.public.*.cidr_block
}

output "private_subnet_cidrs" {
  value = aws_subnet.private.*.cidr_block
}
