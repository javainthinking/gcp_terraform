// Configure the Google Cloud provider
provider "google" {
  credentials = file("../../api-project-711843241151-9c01cb4e763a.json")
  project     = "api-project-711843241151"
  region      = "asia-southeast1"
}

resource "google_sql_database_instance" "instance" {
  name             = "my-sqlserver-instance"
  database_version = "SQLSERVER_2017_ENTERPRISE"
  root_password    = "N1cetest"
  settings {
    tier              = "db-custom-2-13312"
    availability_type = "REGIONAL"
  }

  deletion_protection = "false"
}
