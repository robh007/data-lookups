output "vpc" {
  value = data.aws_vpc.this.id
}

output "subnets" {
  value = data.aws_subnets.this.ids
}

