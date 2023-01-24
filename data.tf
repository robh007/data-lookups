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

data "aws_resourcegroupstaggingapi_resources" "ecs" {
  count                 = contains(var.resources, "ecs") ? 1 : 0
  resource_type_filters = ["ecs:cluster"]

  dynamic "tag_filter" {
    for_each = var.tags
    content {
      key    = tag_filter.key
      values = [tag_filter.value]
    }
  }
}

data "aws_resourcegroupstaggingapi_resources" "alb" {
  count                 = contains(var.resources, "alb") ? 1 : 0
  resource_type_filters = ["elasticloadbalancing:loadbalancer"]

  dynamic "tag_filter" {
    for_each = var.tags
    content {
      key    = tag_filter.key
      values = [tag_filter.value]
    }
  }
}

data "aws_lb_listener" "this" {
  count             = contains(var.resources, "alb") ? 1 : 0
  load_balancer_arn = data.aws_resourcegroupstaggingapi_resources.alb[0].resource_tag_mapping_list[0].resource_arn
  port              = 80
}

data "aws_security_group" "this" {
  count = contains(var.resources, "sg") ? 1 : 0
  tags  = var.tags
}
