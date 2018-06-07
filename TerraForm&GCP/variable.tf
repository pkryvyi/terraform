#list of variables, which we use in main.tf
variable "name" {
  default = "web"
}

variable "credential" {
  default = "pk-gcp-project-cd981c4118ab.json"
}

variable "image" {
  default = "centos-7"
}

variable "zone" {
  default = "europe-west1-b"
}

variable "project" {
  default = "pk-gcp-project"
}

variable "region" {
  default = "europe-west1"
}

variable "service_port" {
  default = "80"
}
