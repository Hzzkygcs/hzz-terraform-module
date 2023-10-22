#provider "aws" {
#  region = var.region
#  shared_credentials_files = [local.aws_creds_path]
#}

resource "aws_lambda_function" "terraform_lambda_func" {
  filename = data.archive_file.lamba_source_code_zip.output_path
  function_name = var.function_name
  role          = aws_iam_role.lambda_role.arn
  handler = var.handler
  runtime = var.runtime
  depends_on = [aws_iam_role_policy_attachment.lambda_iam_policy_attachment]
  tags = {
    "uuid": local.lambda_id
  }
}
