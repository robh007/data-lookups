output "vpc" {
  value = length(data.aws_vpc.this) > 0 ? data.aws_vpc.this[0].id : null
}

output "subnets" {
  value = length(data.aws_subnets.this) > 0 ? data.aws_subnets.this[0].ids : null
}

output "alb" {
  value = length(data.aws_alb.this) > 0 ? data.aws_alb.this[0].id : null
}

output "tagged_resources" {
  value = length(data.aws_resourcegroupstaggingapi_resources.this) > 0 ? flatten(data.aws_resourcegroupstaggingapi_resources.this[*].resource_tag_mapping_list[*].resource_arn) : null
}
