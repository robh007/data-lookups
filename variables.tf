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
