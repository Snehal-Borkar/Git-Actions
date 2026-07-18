variable "aws_region" {

  default = "ap-south-1"

}

variable "lambda_name" {

  default = "hello-lambda"

}

variable "lambda_bucket" {

  default = "lambda-artifacts-demo-dev"

}

variable "lambda_key" {

  default = "lambda-packages/hello-lambda-dev.zip"

}