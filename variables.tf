variable "region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "user_names" {
  type        = list(string)
  default = ["user1", "user2", "user3"]
}

variable "group_name" {
  type        = string
  default = "my-group"
}
