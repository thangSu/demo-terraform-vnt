variable "lambda_name" {
    type = list
    default = ["get_db","delete_db","insert_db","modify_db"]
}

variable "python_file" {
    type = list
    default = ["dynamodb_get", "dynamodb_delete", "dynamodb_insert","dynamodb_modify"]
}