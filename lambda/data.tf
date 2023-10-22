data "archive_file" "lamba_source_code_zip" {
  source_dir = var.source_dir
  output_path = "${path.root}/.terraform/temp/${local.lambda_id}.zip"
  type        = "zip"
}

data "aws_iam_policy_document" "lambda_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}