terraform {
  backend "s3" {}
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.57.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-1"
}
