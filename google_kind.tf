terraform {
  required_version = ">= 1.3.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

############################
# Variables
############################

variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

############################
# SSL Policy
############################

resource "google_compute_ssl_policy" "this" {
  name            = "example-ssl-policy"
  profile         = "MODERN"
  min_tls_version = "TLS_1_2"
}

############################
# Global Static IP
############################

resource "google_compute_global_address" "this" {
  name = "example-global-ip"
}

############################
# Cloud Armor Security Policy
############################

resource "google_compute_security_policy" "this" {
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

############################
# Outputs
############################

output "ssl_policy_name" {
  value = google_compute_ssl_policy.this.name
}

output "global_ip_address" {
  value = google_compute_global_address.this.address
}

output "security_policy_name" {
  value = google_compute_security_policy.this.name
}
