#creating gcp-instances
resource "google_compute_instance" "default" {
  count        = "${var.count}"
  name         = "${var.name}${count.index + 1}"
  machine_type = "f1-micro"
  zone         = "${var.zone}"

  boot_disk {
    initialize_params {
      image = "${var.image}"
    }
  }

  #creating default network
  network_interface {
    network       = "default"
    access_config = {}
  }
}
