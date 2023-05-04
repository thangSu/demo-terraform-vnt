resource "aws_dynamodb_table" "student_table"  {
    name     = "${var.table_name}"
    hash_key = "${var.primary_key}"
    billing_mode = "${var.billing_mode}"
    read_capacity = var.read_capacity
    write_capacity = var.write_capacity

    attribute {
      name = "${var.primary_key}"
      type = "S"
    }
    tags = {
        Name = "${var.table_name}",
        Environment = "terraform"
    }
}