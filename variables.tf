variable "aws_region" {
  type = string
  default = "us-east-1"
}

# variable "access_key" {
#     type = string
# }

# variable "secret_key" {
#     type = string
# }

variable "selected_subnet_id" {
    type = string
    default = "subnet-139be149"
}

variable "vpc_id" {
  type    = string
  default = "vpc-ac0851d5"
}

variable "zone_id" {
  type    = string
  default = "Z271QMQXBD6V6U"
}

variable "key_name" {
  default     = "my-key-pair"
  description = "The name of the key pair to create."
  type        = string
}