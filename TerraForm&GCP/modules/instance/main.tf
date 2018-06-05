provider "google" {
  credentials = "pk-gcp-project-cd981c4118ab.json"
  project     = "${var.project}"
  region      = "${var.region}"
}

resource "google_compute_instance" "project" {
  count        = "${var.count}"
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
