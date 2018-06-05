variable "name" {
  default = "vpc"
}

variable "namefirawall" {
  default = "firefall"
}

variable "ports" {
  type = "list"
}

variable "protocol" {}
