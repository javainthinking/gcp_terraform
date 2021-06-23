// Configure the Google Cloud provider
provider "google" {
  credentials = file("../../api-project-711843241151-9c01cb4e763a.json")
  project     = "api-project-711843241151"
  region      = "asia-southeast1"
}

resource "google_bigtable_instance" "production-instance" {
  name = "tf-instance"

  cluster {
    cluster_id   = "tf-instance-cluster"
    num_nodes    = 4
    storage_type = "SSD"
    zone         = "asia-southeast1-a"
  }

  deletion_protection = false

  labels = {
    my-label = "prod-label"
  }
}
