// Configure the Google Cloud provider
provider "google" {
  credentials = file("../../api-project-711843241151-9c01cb4e763a.json")
  project     = "api-project-711843241151"
  region      = "asia-southeast1"
}

resource "google_redis_instance" "cache" {
  name           = "ha-memory-cache"
  tier           = "STANDARD_HA"
  memory_size_gb = 8

  location_id             = "asia-southeast1-a"
  alternative_location_id = "asia-southeast1-b"

  authorized_network = google_compute_network.redis-network.id

  redis_version     = "REDIS_5_0"
  display_name      = "Terraform Test Instance"
  reserved_ip_range = "192.168.0.0/29"

  labels = {
    my_key    = "my_val"
    other_key = "other_val"
  }
}

resource "google_compute_network" "redis-network" {
  name = "redis-test-network"
}
