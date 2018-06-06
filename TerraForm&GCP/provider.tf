#describes cloud provider and credentials for connecting
provider "google" {
  credentials = "${var.credential}"

  project = "${var.project}"
  region  = "${var.region}"
}
