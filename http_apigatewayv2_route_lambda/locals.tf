locals {
  route_key = trimprefix("${(var.path == "$default")? "" : var.method} ${var.path}", " ")
}