resource "google_compute_ssl_policy" "default" {
  name            = "example-ssl-policy"
  profile         = "MODERN"
  min_tls_version = "TLS_1_2"
}
