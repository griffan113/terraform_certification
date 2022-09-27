provider "google" {
  region      = "us-east-1"
  credentials = file("credentials.json")
}

resource "google_compute_firewall" "allow-http-access" {
  name          = "allow-http-access"
  network       = "default"
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["allow-http-access"]

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }
}

resource "google_compute_instance" "debian-web-server" {
  name         = "debian-web-server"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default" // This Enable Private IP Address
    access_config {}    // This Enable Public IP Address
  }

  tags = ["allow-http-access"]

  metadata_startup_script = file("startup.sh")
}
