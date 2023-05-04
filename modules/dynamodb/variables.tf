variable "table_name" {
    type = string 
    default = "student"
}
variable "primary_key" {
    type = string
    default = "id"
}
variable "billing_mode" {
    type = string
    default = "PROVISIONED"
}
variable "read_capacity" {
  type = number
  default = 20
}
variable "write_capacity" {
  type = number
  default = 20
}