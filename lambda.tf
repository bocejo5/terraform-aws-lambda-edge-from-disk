resource "aws_lambda_function" "lambda" {
  filename         = local.lambda_archive
  function_name    = local.name
  role             = "${aws_iam_role.Lambda-edge-image-service-${var.environment}.arn}"
  handler          = local.handler_name
  source_code_hash = filebase64sha256(local.lambda_archive)
  runtime          = local.runtime
  publish          = "true"
  provider         = aws.us
  memory_size      = local.memory_limit
  timeout          = local.timeout
  description      = local.description
}