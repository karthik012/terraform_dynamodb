provider "aws" {
  region = "eu-east-1"
}

module "dydb_module" {

  source                        = source = "../../"
  create_dynamodb_table         = "true"
  name                          = "swarm-dev-dyndbtable"
  read_capacity                 = 1
  write_capacity                = 1
  billing_mode                  = "PROVISIONED"
  hash_key                      = "node_type"
  attribute_name                = "node_type"
  attribute_type                = "S"
  enable_server_side_encryption = "true"
  tags                          = "{Name=test, Sample=tags}"
}
