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



module "lambda" {
    source       = "./modules/lambda"
    #dynamodb_arn = module.dynamodb.dynamodb_arn
    # depends_on = [
    # module.dynamodb
    # ]
    source_file = [
        "lambda_codes/dynamodb_get.py",
        "lambda_codes/dynamodb_delete.py",
        "lambda_codes/dynamodb_insert.py",
        "lambda_codes/dynamodb_modify.py"
    ]
    output_path = [
        "lambda_codes/zip/dynamodb_get.zip",
        "lambda_codes/zip/dynamodb_delete.zip",
        "lambda_codes/zip/dynamodb_insert.zip",
        "lambda_codes/zip/dynamodb_modify.zip",
    ]
}

module "rest_api_gateway" {
    source = "./demo-terraform-vnt/modules.tf/rest_api_gateway"
    name_stage = "dev"
    api_method = ["GET", "DELETE", "POST", "PUT"]
    aws_lambda_function_invoke_arn = module.lambda.lambda_invoke_arn
    lambda_name = module.lambda.lambda_name
}