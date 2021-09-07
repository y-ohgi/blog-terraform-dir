#########################
# Instance Profile
#########################
resource "aws_iam_role" "this" {
  name = local.name
  path = "/"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  ]
}

resource "aws_iam_instance_profile" "this" {
  name = local.name
  role = aws_iam_role.this.name
}

#########################
# EC2
#########################
data "aws_ssm_parameter" "al2_ami_latest" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

resource "aws_instance" "this" {
  ami = data.aws_ssm_parameter.al2_ami_latest.value

  instance_type = "t2.micro"

  iam_instance_profile = aws_iam_instance_profile.this.id

  subnet_id              = data.terraform_remote_state.network.outputs.public_subnet_ids[0]
  vpc_security_group_ids = [data.terraform_remote_state.sg.outputs.ec2_ssh_sg_id]

  tags = local.tags
}


