variable "state_bucket" {
  type = string
}

data "terraform_remote_state" "network" {
  backend = "s3"

  workspace = terraform.workspace

  config = {
    bucket = var.state_bucket
    key    = "network/terraform.tfstate"
  }
}

variable "project_name" {
  description = "プロジェクト名（prefix で使用する）"
  default     = "myprj"
}

locals {
  workspaces = {
    dev = local.dev
    prd = local.prd
  }

  workspace = local.workspaces[terraform.workspace]

  name = "${var.project_name}-${basename(abspath(path.module))}"

  tags = {
    Name        = local.name
    Service     = local.name
    Environment = terraform.workspace
    Terraform   = "true"
  }
}
