data "archive_file" "zip" {
    count = length(var.python_file)
    type = "zip"
    source_file = "demo-lambda/${var.python_file[count.index]}.py"
    output_path = "demo-lambda/${var.lambda_name[count.index]}.zip"
}

resource "aws_lambda_function" "lambda" {
    count = length(var.lambda_name)
    function_name = "${var.lambda_name[count.index]}"
    filename         = data.archive_file.zip[count.index].output_path
    source_code_hash = data.archive_file.zip[count.index].output_base64sha256
    role    = aws_iam_role.db_role.arn
    handler = "${var.python_file[count.index]}.lambda_handler"
    runtime = "python3.8"
}