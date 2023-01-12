variable "aws_region" {
  description = "AWS Region"
  default     = "eu-west-1"
}

variable "vpc_tags" {
  description = "Map of tags to find a VPC"
  default     = {}

  type = map(any)
}

variable "subnet_tags" {
  description = "Map of tags for Subnets"
  default     = {}

  type = map(any)
}

variable "alb_name" {
  description = "Name of ALB to find"
  default     = null
}
