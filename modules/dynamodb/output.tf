output "dynamodb_arn" {
    value = "${aws_dynamodb_table.student-table.arn}"
}