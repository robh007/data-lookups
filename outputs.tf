output "vpc_id" {
  value = length(data.aws_vpc.this) > 0 ? data.aws_vpc.this[0].id : null
}

output "vpc_subnets" {
  value = length(data.aws_subnets.this) > 0 ? data.aws_subnets.this[0].ids : null
}

output "ecs_cluster_arn" {
  value = length(data.aws_resourcegroupstaggingapi_resources.ecs) > 0 ? data.aws_resourcegroupstaggingapi_resources.ecs[0].resource_tag_mapping_list[0].resource_arn : null
}

output "ecs_cluster_name" {
  value = length(data.aws_resourcegroupstaggingapi_resources.ecs) > 0 ? reverse(split("/", data.aws_resourcegroupstaggingapi_resources.ecs[0].resource_tag_mapping_list[0].resource_arn ))[0] : null
}

output "alb_arn" {
  value = length(data.aws_resourcegroupstaggingapi_resources.alb) > 0 ? data.aws_resourcegroupstaggingapi_resources.alb[0].resource_tag_mapping_list[0].resource_arn : null
}

output "alb_listener_arn" {
  value = length(data.aws_lb_listener.this) > 0 ? data.aws_lb_listener.this[0].arn : null
}

output "security_group" {
  value = length(data.aws_security_group.this) > 0 ? data.aws_security_group.this[0].id : null
}