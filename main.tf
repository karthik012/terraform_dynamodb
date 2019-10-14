resource "aws_dynamodb_table" "db_with_multipleattributes" {
  count          = "${var.create_dynamodb_table_multiple_attributes ? 1 : 0}"
  name           = "${var.name}"
  billing_mode   = "${var.billing_mode}"
  read_capacity  = "${var.read_capacity}"
  write_capacity = "${var.write_capacity}"
  hash_key       = "${var.hash_key}"

  server_side_encryption {
    enabled = "${var.enable_server_side_encryption}"
  }

  attribute = "${var.dynamodb_attributes}"

  lifecycle {
    ignore_changes = ["read_capacity", "write_capacity"]
  }
}
