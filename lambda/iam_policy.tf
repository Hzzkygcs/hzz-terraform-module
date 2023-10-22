
resource "aws_iam_role_policy_attachment" "lambda_iam_policy_attachment" {
  policy_arn = aws_iam_policy.lambda_iam_policy.arn
  role       = aws_iam_role.lambda_role.name
}

resource "aws_iam_policy" "lambda_iam_policy" {
  name = "aws_iam_policy_for_terraform_aws_lambda_role-${local.lambda_id}"
  path = "/"
  tags = {
    "uuid": local.lambda_id
  }
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
        ],
        "Resource": "arn:aws:logs:*:*:*",
        "Effect": "Allow"
      }
    ]
  })
}