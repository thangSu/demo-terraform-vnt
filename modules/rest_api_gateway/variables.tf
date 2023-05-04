variable "api_method" {
  type    = list(any)
  default = ["GET", "DELETE", "POST", "PUT"]
}
variable "name_api" {
  type    = string
}
variable "endpoint_path" {
  type    = list(any)
  default = ["get_student", "delete_student", "create_student", "update_student"]
}

variable "name_stage" {
  type    = string
}