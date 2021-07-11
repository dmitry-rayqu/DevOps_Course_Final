terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.12.31"
}

provider "aws" {
  region = "eu-west-2"
  profile = "default"
}

module "vpc" {
  source = "./modules/vpc"
  env    = "devops_course"
  az     = "eu-west-2a"
}

module "test_instance" {
  source = "./modules/ec2"
  subnet_id = module.vpc.public_subnet_id
  sg_ids = [module.vpc.public_sg.id]
  name = "test_instance"
  key_name = "key"
}

output "public_ip" {
  value = module.test_instance.elastic_ip
}
