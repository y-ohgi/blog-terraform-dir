terraform {
  backend "s3" {
    /* see Makefile terraform/init for actual options */
  }
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
