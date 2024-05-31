variable "vpc-id" {
  type = string
}
variable "subnet-public-ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "subnet-private-ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}