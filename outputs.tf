output "ssl_policy_name" {
  value = google_compute_ssl_policy.default.name
}

output "global_ip_address" {
  value = google_compute_global_address.default.address
}

output "security_policy_name" {
  value = google_compute_security_policy.default.name
}
