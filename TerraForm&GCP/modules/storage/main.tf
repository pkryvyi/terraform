resource "google_storage_bucket" "storage" {
  name          = "${var.name}"
  location      = "${var.location}"
  storage_class = "${var.storage_class}"
}
