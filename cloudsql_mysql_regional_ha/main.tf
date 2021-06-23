// Configure the Google Cloud provider
provider "google" {
  credentials = file("../../api-project-711843241151-9c01cb4e763a.json")
  project     = "api-project-711843241151"
  region      = "asia-southeast1"
}

resource "google_sql_database_instance" "instance" {
  name             = "my-mysql80-instance"
  database_version = "MYSQL_8_0"
  settings {
    tier              = "db-custom-2-13312"
    availability_type = "REGIONAL"
    backup_configuration {
      binary_log_enabled = true
      enabled            = true
    }
  }

  deletion_protection = "false"
}
