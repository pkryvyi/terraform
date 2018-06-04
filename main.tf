variable "zone" {
  default = "europe-west1-b"
}

variable "region" {
  default = "europe-west1"
}

variable "name" {
  default = "web"
}

variable "image" {
  default = "ubuntu-os-cloud/ubuntu-1604-lts"
}

variable "service_port" {
  default = "80"
}

variable "server_port" {
  description = "The port"
  default     = "8080"
}

variable "project" {
  default = "pk-gcp-project"
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

provider "google" {
  credentials = "pk-gcp-project-cd981c4118ab.json"
  project     = "${var.project}"
  region      = "${var.region}"
}

resource "google_compute_instance" "project" {
  count        = 2
  name         = "server${count.index + 1}"
  machine_type = "f1-micro"
  zone         = "${var.zone}"

  boot_disk {
    initialize_params {
      image = "${var.image}"
    }
  }

  network_interface {
    network       = "default"
    access_config = {}
  }
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
