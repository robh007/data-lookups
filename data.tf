provider "aws" {
  region = var.aws_region
}

data "aws_vpc" "this" {
  tags = var.vpc_tags
}

data "aws_subnets" "this" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.this.id]
  }

  tags = var.subnet_tags
}

data "aws_alb" "this" {
  count = var.alb_name != null ? 1 : 0
  name  = var.alb_name
}
