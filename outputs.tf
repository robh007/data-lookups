output "vpc" {
  value = length(data.aws_vpc.this) > 0 ? data.aws_vpc.this[0].id : null
}

output "subnets" {
  value = length(data.aws_subnets.this) > 0 ? data.aws_subnets.this[0].ids : null
}

output "alb" {
  value = length(data.aws_alb.this) > 0 ? data.aws_alb.this[0].id : null
}

output "ecs_cluster" {
  value = length(data.aws_resourcegroupstaggingapi_resources.ecs_cluster) > 0 ? data.aws_resourcegroupstaggingapi_resources.ecs_cluster[0].resource_tag_mapping_list[0].resource_arn : null
}
