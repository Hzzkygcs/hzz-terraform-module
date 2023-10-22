variable "method" {
  default = "ANY"
}
variable "path" {}


variable "aws_lambda_function" {
  # List each field in `azurerm_route_table` that your module will access
  type = object({
    function_name = string
    arn = string
  })
}

variable "aws_apigatewayv2_api" {
  # List each field in `azurerm_route_table` that your module will access
  type = object({
    id = string
    execution_arn = string
  })
}