// Configure the Google Cloud provider
provider "google" {
  credentials = file("../../api-project-711843241151-9c01cb4e763a.json")
  project     = "api-project-711843241151"
  region      = "asia-southeast1"
}

resource "google_sql_database_instance" "instance" {
  name             = "my-pg-instance"
  database_version = "POSTGRES_13"
  settings {
    tier              = "db-f1-micro"
    availability_type = "REGIONAL"
  }

  deletion_protection = "false"
}
