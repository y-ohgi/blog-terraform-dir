output "vpc_id" {
  value = aws_vpc.this.id
}

output "vpc_cidr" {
  value = aws_vpc.this.cidr_block
}

# output "private_subnet_ids" {
#   value = module.thanos_vpc.private_subnets
# }
# 
# output "public_subnet_ids" {
#   value = module.thanos_vpc.public_subnets
# }
# 
# output "subnet_cidr" {
#   value = local.workspace["cidr"]
# }
# 
# output "private_subnet_cidrs" {
#   value = local.workspace["private_subnets"]
# }
# 
# output "public_subnet_cidrs" {
#   value = local.workspace["public_subnets"]
# }
