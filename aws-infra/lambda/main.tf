resource "aws_iam_role" "lambda_role" {

  name = "hello-lambda-role"

  assume_role_policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Action = "sts:AssumeRole"

        Effect = "Allow"

        Principal = {

          Service = "lambda.amazonaws.com"

        }

      }

    ]

  })

}

resource "aws_iam_role_policy_attachment" "basic" {

  role = aws_iam_role.lambda_role.name

  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"

}

resource "aws_lambda_function" "lambda" {

  function_name = var.lambda_name

  role = aws_iam_role.lambda_role.arn

  runtime = "python3.12"

  handler = "app.lambda_handler"

  s3_bucket = var.lambda_bucket

  s3_key = var.lambda_key

}