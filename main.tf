# Networking resources
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

# GKE Cluster

resource "google_container_cluster" "primary" {
  name               = "my-gke-cluster"
  location           = "us-central1"
  network            = google_compute_network.default.name
  subnetwork         = google_compute_subnetwork.default_1.name
  initial_node_count = 1
  networking_mode    = "VPC_NATIVE"

  node_config {
    service_account  = "default"
    image_type       = "COS_CONTAINERD"
    local_ssd_count  = 0
    machine_type     = "e2-medium"
    preemptible      = false

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    metadata = {
      "disable-legacy-endpoints" = "true"
    }

    shielded_instance_config {
      enable_integrity_monitoring = true
      enable_secure_boot          = false
    }
  }

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = "10.191.0.0/17"
    services_ipv4_cidr_block = "10.191.128.0/21"
  }
}

resource "google_compute_global_address" "default" {
  name         = "notesapp-external-ip"
  address_type = "EXTERNAL"
}
