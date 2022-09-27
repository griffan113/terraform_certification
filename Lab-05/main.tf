provider "google" {
  project     = var.project
  region      = "us-east1"
  zone        = "us-east1-b"
  credentials = file("./credentials.json")
}

resource "google_compute_instance" "web-server" {
  name         = "web-server"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  metadata_startup_script = file("./startup.sh")

  network_interface {
    network = "default"
    access_config {}
  }
}
