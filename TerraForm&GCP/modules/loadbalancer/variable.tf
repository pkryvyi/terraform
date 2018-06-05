variable "service_port" {
  default = "80"
}

variable "server_port" {
  description = "The port"
  default     = "8080"
}

variable "protocol" {
  default = "tcp"
}

variable "ports" {
  type    = "list"
  default = [80, 8080, 443]
}

variable "namefirewall" {
  default = "firewall"
}

variable "region" {}
variable "name" {}
variable "project" {}

variable "instances" {
  type = "list"
}
