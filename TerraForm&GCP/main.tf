/**

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



resource "google_compute_forwarding_rule" "default" {
  project               = "${var.project}"
  name                  = "${var.name}"
  target                = "${google_compute_target_pool.default.self_link}"
  load_balancing_scheme = "EXTERNAL"
  port_range            = "${var.service_port}"
  region                = "${var.region}"
}

resource "google_compute_target_pool" "default" {
  name      = "${var.name}"
  project   = "${var.project}"
  region    = "${var.region}"
  instances = ["${google_compute_instance.project.*.self_link}"]

  health_checks = [
    "${google_compute_http_health_check.default.name}",
  ]
}

resource "google_compute_http_health_check" "default" {
  project      = "${var.project}"
  name         = "${var.name}-hc"
  request_path = "/"
  port         = "${var.service_port}"
}

resource "google_compute_firewall" "test" {
  //  depends_on    = ["google_compute_network.test"]
  name    = "${var.namefirewall}"
  network = "default"

  allow {
    protocol = "${var.protocol}"
    ports    = "${var.ports}"
  }
}
**/
module "servers" {
  source = "../modules/instance/"
  name   = "servers"

  //  network = "${module.vpc.name}"
  count = "2"
  image = "${var.image}"
  zone  = "${var.zone}"
}
