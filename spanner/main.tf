// Configure the Google Cloud provider
provider "google" {
  credentials = file("../../api-project-711843241151-9c01cb4e763a.json")
  project     = "api-project-711843241151"
  region      = "asia-southeast1"
}

resource "google_spanner_instance" "basic" {
  config       = "nam-eur-asia1"
  display_name = "Test Spanner Instance"
  num_nodes    = 2
  labels = {
    "foo" = "bar"
  }
}
