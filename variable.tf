variable "name" {
  type        = "string"
  description = "The name of the table, this needs to be unique within a region."
}

variable "hash_key" {
  type        = "string"
  description = "The attribute to use as the hash (partition) key. Must also be defined as an attribute"
}

variable "billing_mode" {
  type        = "string"
  default     = "PROVISIONED"
  description = "Controls how you are charged for read and write throughput and how you manage capacity. The valid values are PROVISIONED and PAY_PER_REQUEST. Defaults to PROVISIONED."
}

variable "read_capacity" {
  type        = "string"
  default     = "1"
  description = "The number of read units for this table. If the billing_mode is PROVISIONED, this field is required."
}

variable "write_capacity" {
  type        = "string"
  default     = "1"
  description = "The number of write units for this table. If the billing_mode is PROVISIONED, this field is required."
}

variable "attributes" {
  type        = "list"
  default     = []
  description = "a list of db parameter maps to apply"
}

variable "dynamodb_attributes" {
  type        = "list"
  default     = []
  description = "a list of db parameter maps to apply"
}

variable "tags" {
  type = "map"

  default = {
    Name = "table1"
    Env  = "Dev"
  }

  description = "Tags for the dynamodb table"
}

variable "enable_server_side_encryption" {
  description = "Defines if the dynamodb table needs to be encrypted at rest"
  default     = "true"
}

variable "create_dynamodb_table_multiple_attributes" {
  description = "Denotes if the dynamodb table to be created"
  default     = false
}

variable "range_key" {
  type    = "string"
  default = ""
}

variable "dynamodb_attributes" {
  type    = "list"
  default = []
}

variable "global_secondary_index" {
  type    = "list"
  default = []
}