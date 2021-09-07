locals {
  dev = {
    cidr = "172.16.0.0/16"

    azs             = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"]
    private_subnets = ["172.16.1.0/24", "172.16.2.0/24", "172.16.3.0/24"]
    public_subnets  = ["172.16.101.0/24", "172.16.102.0/24", "172.16.103.0/24"]
  }
}
