// Configure the Google Cloud provider
provider "google" {
  credentials = file("../../api-project-711843241151-9c01cb4e763a.json")
  project     = var.my_project
  region      = "asia-southeast1"
}

variable "my_project" {
  default = "api-project-711843241151"
}

resource "google_app_engine_application" "app" {
  project       = var.my_project
  location_id   = "asia-southeast1"
  database_type = "CLOUD_FIRESTORE"
}

resource "google_firestore_document" "mydoc" {
  project     = var.my_project
  collection  = "somenewcollection"
  document_id = "my-doc-firestore"
  fields      = "{\"something\":{\"mapValue\":{\"fields\":{\"akey\":{\"stringValue\":\"avalue\"}}}}}"
}

resource "google_firestore_document" "sub_document" {
  project     = var.my_project
  collection  = "${google_firestore_document.mydoc.path}/subdocs"
  document_id = "bitcoinkey"
  fields      = "{\"something\":{\"mapValue\":{\"fields\":{\"ayo\":{\"stringValue\":\"val2\"}}}}}"
}

resource "google_firestore_document" "sub_sub_document" {
  project     = var.my_project
  collection  = "${google_firestore_document.sub_document.path}/subsubdocs"
  document_id = "asecret"
  fields      = "{\"something\":{\"mapValue\":{\"fields\":{\"secret\":{\"stringValue\":\"hithere\"}}}}}"
}
