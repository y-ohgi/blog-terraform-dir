## About
SecurityGroup 用module

## How to Use
```hcl
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
```

---

## terraform-docs

以下、terraform-docs で生成
```
$ terraform-docs markdown table --output-file README.md --output-mode inject .
```


## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ingress_with_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | 作成するセキュリティグループに付与する説明 | `string` | `""` | no |
| <a name="input_egress_cidr_blocks"></a> [egress\_cidr\_blocks](#input\_egress\_cidr\_blocks) | egress へ設定するCIDR レンジ | `list` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_ingress_cidr_blocks"></a> [ingress\_cidr\_blocks](#input\_ingress\_cidr\_blocks) | 許可するIngressの一覧（簡易版）。e.g. [{'cidr\_blocks': '10.0.0.0/16', 'port': 80}, ...] | `list` | `[]` | no |
| <a name="input_ingress_with_security_group_rules"></a> [ingress\_with\_security\_group\_rules](#input\_ingress\_with\_security\_group\_rules) | 許可するIngress（セキュリティグループベース）の一覧。 e.g. [{'source\_security\_group\_id': 'sg-1a2b3c4d', 'from\_port': 80, 'to\_port': 80, 'protocol': 'tcp', 'description': ''}, ...] | `list` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | リソースの識別子として使用する名前 | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | リソースに付与するタグ | `map` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | セキュリティグループを作成するVPCのID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sg_id"></a> [sg\_id](#output\_sg\_id) | 作成したセキュリティグループのID |

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ingress_with_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | 作成するセキュリティグループに付与する説明 | `string` | `""` | no |
| <a name="input_egress_cidr_blocks"></a> [egress\_cidr\_blocks](#input\_egress\_cidr\_blocks) | egress へ設定するCIDR レンジ | `list` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_ingress_cidr_blocks"></a> [ingress\_cidr\_blocks](#input\_ingress\_cidr\_blocks) | 許可するIngressの一覧（簡易版）。e.g. [{'cidr\_blocks': '10.0.0.0/16', 'port': 80}, ...] | `list` | `[]` | no |
| <a name="input_ingress_with_security_group_rules"></a> [ingress\_with\_security\_group\_rules](#input\_ingress\_with\_security\_group\_rules) | 許可するIngress（セキュリティグループベース）の一覧。 e.g. [{'source\_security\_group\_id': 'sg-1a2b3c4d', 'from\_port': 80, 'to\_port': 80, 'protocol': 'tcp', 'description': ''}, ...] | `list` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | リソースの識別子として使用する名前 | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | リソースに付与するタグ | `map` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | セキュリティグループを作成するVPCのID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sg_id"></a> [sg\_id](#output\_sg\_id) | 作成したセキュリティグループのID |
<!-- END_TF_DOCS -->
