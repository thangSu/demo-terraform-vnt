variable "api_method" {
  type    = list(any)
}
variable "name_api" {
  type    = string
}
variable "endpoint_path" {
  type    = string
  default = "student"
}

variable "name_stage" {
  type    = string
}
variable "aws_lambda_function_invoke_arn" {
  type    = list(any)
}

