output "dynamodb_arn" {
    value = aws_dynamodb_table.student_table.arn
}