resource "google_compute_security_policy" "default" {
  name        = "example-security-policy"
  description = "Basic Cloud Armor security policy"

  rule {
    priority = 1000
    action   = "allow"

    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = ["0.0.0.0/0"]
      }
    }

    description = "Allow all traffic"
  }

  rule {
    priority = 2147483647
    action   = "deny(403)"

    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = ["*"]
      }
    }

    description = "Default deny rule"
  }
}
