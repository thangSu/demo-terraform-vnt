resource "aws_iam_policy" "lambda_db_policy" {
    name = "db_policy"
    path = "/"
    policy = data.aws_iam_policy_document.lambda_policy_document.json
    tags = {
      "Environment" = "terraform"
    }
}
data "aws_iam_policy_document" "lambda_policy_document"{
    statement {
      effect = "Allow"
      actions = [
        "dynamodb:DeleteItem",
        "dynamodb:GetItem",
        "dynamodb:PutItem",
        "dynamodb:Query",
        "dynamodb:UpdateItem"
      ]
      resources =[
          var.dynamodb_arn
      ]
    }
    statement {
      effect = "Allow"
      actions =[
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ]
      resources = [ "*" ]
    }
}
resource "aws_iam_role" "lambda_db_role" {
  name = "db_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
      tags = {
      "Environment" = "terraform"
    }
}
resource "aws_iam_role_policy_attachment" "lambda_db_rpa" {
    role = aws_iam_role.lambda_db_role.name
    policy_arn = aws_iam_policy.lambda_db_policy.arn
}