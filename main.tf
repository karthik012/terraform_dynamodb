locals {
  attributes = [
    {
      name = "${var.range_key}"
      type = "S"
    },
    {
      name = "${var.hash_key}"
      type = "S"
    },
    "${var.dynamodb_attributes}",
  ]

  # Use the `slice` pattern (instead of `conditional`) to remove the first map from the list if no `range_key` is provided
  # Terraform does not support conditionals with `lists` and `maps`: aws_dynamodb_table.default: conditional operator cannot be used with list values
  from_index = "${length(var.range_key) > 0 ? 0 : 1}"

  attributes_final = "${slice(local.attributes, local.from_index, length(local.attributes))}"
}

resource "aws_dynamodb_table" "db_with_multipleattributes" {
  name                   = "${var.name}"
  billing_mode           = "${var.billing_mode}"
  read_capacity          = "${var.read_capacity}"
  write_capacity         = "${var.write_capacity}"
  hash_key               = "${var.hash_key}"
  range_key              = "${var.range_key}"
  attribute              = ["${local.attributes_final}"]
  global_secondary_index = ["${var.global_secondary_index}"]

  server_side_encryption {
    enabled = "${var.enable_server_side_encryption}"
  }

  tags = "${var.tags}"
}
