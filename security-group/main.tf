locals {
  vpc_id = data.terraform_remote_state.network.outputs.vpc_id
}

module "ec2_ssh_sg" {
  source = "./modules/security-group"

  vpc_id = local.vpc_id

  name = "${local.name}-ec2-ssh-sg"
  tags = local.tags

  ingress_cidr_blocks = [
    {
      "cidr_blocks" : "0.0.0.0/0",
      "port" : "22"
    }
  ]
}
