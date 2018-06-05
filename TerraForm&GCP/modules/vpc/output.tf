output "name" {
  value = "${google_compute_network.vpc.name}"
}

output "network" {
  value = "${google_compute_network.vpc.self_link}"
}
