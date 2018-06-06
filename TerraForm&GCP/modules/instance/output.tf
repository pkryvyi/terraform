#output instance info
output "url" {
  value = ["${google_compute_instance.default.*.self_link}"]
}
