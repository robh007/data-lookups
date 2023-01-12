data "aws_vpc" "this" {
  count = contains(var.resources, "vpc") ? 1 : 0
  tags  = var.tags
}

data "aws_subnets" "this" {
  count = contains(var.resources, "vpc") ? 1 : 0
  tags  = var.tags
  
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.this[0].id]
  }
}

data "aws_resourcegroupstaggingapi_resources" "ecs_cluster" {
  count = contains(var.resources, "ecs_cluster") ? 1 : 0
  
  resource_type_filters = ["ecs:cluster"]
  
  dynamic "tag_filter" {
    for_each = var.tags
    content {
      key    = tag_filter.key
      values = [tag_filter.value]
    }
  }
}

data "aws_alb" "this" {
  count = contains(var.resources, "alb") ? 1 : 0
  tags  = var.tags
}
