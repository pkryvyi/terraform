variable "name" {
  default = "vpc"
}

variable "namefirewall" {
  default = "firewall"
}

variable "ports" {
  type = "list"
}

variable "protocol" {}
