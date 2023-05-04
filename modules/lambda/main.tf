data "archive_file" "zip" {
    count = length(var.python_file)
    type = "zip"
    source_file = "${var.source_file[count.index]}"
    output_path = "${var.output_path[count.index]}"
}

resource "aws_lambda_function" "lambda" {
    count = length(var.lambda_name)
    function_name = "${var.lambda_name[count.index]}"
    filename         = data.archive_file.zip[count.index].output_path
    source_code_hash = data.archive_file.zip[count.index].output_base64sha256
    role    = aws_iam_role.lambda_db_role.arn
    handler = "${var.python_file[count.index]}.lambda_handler"
    runtime = "python3.8"
    tags = {
      Environment = "terraform"
    }
}