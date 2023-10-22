

resource "aws_iam_role" "lambda_role" {
  name = "tf_lambda_role-${local.lambda_id}"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role_policy.json
  tags = {
    "uuid": local.lambda_id
  }
}

