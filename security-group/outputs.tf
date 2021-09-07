output "ec2_ssh_sg_id" {
  description = "EC2 のssh 用セキュリティグループ"
  value       = module.ec2_ssh_sg.sg_id
}
