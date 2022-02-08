terraform {
  aws   = {
      source    =   "hashicorp/aws"
      version   =   "~> 3.0"
  }
}

provider "aws" {
  region = ["us-east-1" , "us-west-1"]
}

resource "vpc" "custom-vpc" {
  cidr_block    =   "10.0.0.0/16"
}

module "vpc"  {
name                =   "custom-vpc"
cidr                =   "10.0.0.0/16"

azs                 =   ["us-east-1a", "us-west-1a"]
private_subnets     =   ["10.0.1.0/24"]
public_subnets      =   ["10.0.101.0/24"]

enable_nat_gateway  =   true
enable_vpn_gateway  =   true

tags                =   {
    Terraform       =   "true"
    Environment     =   "dev"
}
}

resource "aws_instance" "ec2" {
  ami           = "ami-40d28157"
  instance_type = "t2.micro"
  region        = "us-east-1"  
}

resource "aws_s3_bucket" "my_bucket" {
  region    =   "us-west-1"
}

resource "aws_s3_bucket" "terraform_state" {
    bucket = "terraform-project-state"

    versioning {
      enabled = true
    }

    lifecycle {
      prevent_destroy = true
    }
}

output "s3_bucket_arn" {
    value = "${aws_s3_bucket.terraform_state.arn}"
}
