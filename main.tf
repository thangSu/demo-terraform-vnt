provider "aws" {
    region = "ap-southeast-1"
}
terraform {
    backend "s3" {
        bucket = "dev-terraform-state-vt"
        key = "states/terraform.tfstate"
        region = "ap-southeast-1"
    }

    required_providers {
        aws = {
            version = "4.63.0"
            source  = "hashicorp/aws"
        }
    }
}