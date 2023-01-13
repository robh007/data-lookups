variable "tags" {
  description = "Map of tags to find"
  default     = {}

  type = map(any)
}

variable "resources" {
  description = "List of resources to find"
  default     = []

  type = list(string)
}

variable "resource_types" {
  description = "List of resource types to find via resource groups tagging api"
  default     = []

  type = list(string)
}
