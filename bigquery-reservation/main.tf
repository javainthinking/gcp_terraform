// Configure the Google Cloud provider
provider "google" {
  credentials = file("../../api-project-711843241151-9c01cb4e763a.json")
  project     = "api-project-711843241151"
  region      = "asia-southeast1"
}

resource "google_bigquery_reservation" "bq_reservation" {
  name              = "bigquery-reservation"
  location          = "asia-southeast1"
  slot_capacity     = 0
  ignore_idle_slots = false
}

