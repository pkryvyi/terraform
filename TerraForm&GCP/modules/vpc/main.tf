resource "google_compute_network" "vpc" {
  name                    = "${var.name}"
  auto_create_subnetworks = true
}

resource "google_compute_firewall" "vpc" {
  depends_on = ["google_compute_network.vpc"]
  name       = "${var.namefirewall}"
  network    = "${google_compute_network.vpc.name}"

  allow {
    protocol = "${var.protocol}"
    ports    = "${var.ports}"
  }
}
