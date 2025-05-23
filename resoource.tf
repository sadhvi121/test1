terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.30.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "credible-skill-449404-i8"
  credentials = "${file("key.json")}"
}
#resource "google_service_account" "default" {
 # account_id   = "my-custom-sa"
 # project = "credible-skill-449404-i8"
  #display_name = "Custom SA for VM Instance"
#}

resource "google_compute_instance" "default" {
  name         = "my-instance"
  machine_type = "n2-standard-2"
  zone         = "us-central1-a"
  project = "credible-skill-449404-i8"
  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "NVME"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

  
}
