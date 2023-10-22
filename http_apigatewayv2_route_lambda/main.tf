resource "aws_lambda_permission" "allow_http_api_gateway_to_invoke_lambda" {
  action        = "lambda:InvokeFunction"
  function_name = var.aws_lambda_function.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${var.aws_apigatewayv2_api.execution_arn}/*/*"
}

resource "aws_apigatewayv2_integration" "tell_apigatewayroute_to_invoke_lambda" {
  api_id           = var.aws_apigatewayv2_api.id
  integration_type = "AWS_PROXY"

  integration_method = var.method
  integration_uri    = var.aws_lambda_function.arn
}


resource "aws_apigatewayv2_route" "api_gateway_for_lambda" {
  api_id    = var.aws_apigatewayv2_api.id
  route_key = local.route_key  # format follows the aws_apigatewayv2_api's route_selection_expression
  target = "integrations/${aws_apigatewayv2_integration.tell_apigatewayroute_to_invoke_lambda.id}"
}