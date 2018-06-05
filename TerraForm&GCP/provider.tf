provider "google" {
  credentials = "${var.credential}"

  project = "${var.project}"
  region  = "${var.region}"
}
