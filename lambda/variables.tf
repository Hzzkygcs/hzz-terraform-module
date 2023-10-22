variable "region" {
  default = "ap-southeast-1"
}
variable "source_dir" {}
variable "function_name" {}
variable "handler" {
  default = "main.lambda_handler"
}
variable "runtime" {
  default = "python3.8"
}