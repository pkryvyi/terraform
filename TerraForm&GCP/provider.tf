provider "google" {
  //  credentials = "pk-gcp-project-cd981c4118ab.json"
  //credentials = "${file("${var.credentials}")}"
  credentials = "${var.credential}"

  project = "${var.project}"
  region  = "${var.region}"
}
