module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "penfold-application"
  description   = "Typescript Penfold application"
  handler       = "index.handler"
  runtime       = "nodejs16.x"
  publish       = true

  create_package         = false
  local_existing_package = "../src/dist/index.zip"

  vpc_subnet_ids         = module.vpc.private_subnets
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  attach_network_policy  = true

  allowed_triggers = {
    APIGatewayAny = {
      service    = "apigateway"
      source_arn = "${aws_api_gateway_rest_api.restapi.execution_arn}/*/*/*"
    },
  }

  tags = {
    Name = "penfold-application"
  }
}
