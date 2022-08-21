resource "google_compute_network" "default" {
  name                    = "vpc-app"
  auto_create_subnetworks = false
  mtu                     = 1460
  description             = "vpc for app"
  routing_mode            = "REGIONAL"
}

resource "google_compute_subnetwork" "default_1" {
  name                     = "subnet-app-1"
  ip_cidr_range            = "10.100.0.0/21"
  network                  = google_compute_network.default.id
  description              = "subnet 1 for app"
  stack_type               = "IPV4_ONLY"
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "default_2" {
  name                     = "subnet-app-2"
  ip_cidr_range            = "10.100.8.0/21"
  network                  = google_compute_network.default.id
  description              = "subnet 1 for app"
  stack_type               = "IPV4_ONLY"
  private_ip_google_access = true
}
