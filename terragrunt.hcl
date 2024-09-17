terraform {
    source = "tfr:///terraform-aws-modules/vpc/aws?version=5.8.1"
}

generate "provider" {
    path = "provider.tf"
    if_exists = "overwrite_terragrunt"
    contents = <<EOF
provider "aws" {
  region = "us-east-1"
}
EOF
}

inputs = {
    vpc_name = "my-vpc"
    cidr_block = "10.0.0.0/16"
    azs = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
    private_subnets = ["10.0.1.0/24", "10.0.2.1/24", "10.0.3.0/24"]
    public_subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
    enable_nat_gateway = true
    single_nat_gateway = false

    tags = {
        "Environment" = "dev"
          "IAC" = "True"
    }
}

