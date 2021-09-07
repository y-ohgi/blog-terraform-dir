
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
