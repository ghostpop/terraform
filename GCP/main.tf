terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.74.0"
    }
  }

}

provider "google" {
  project     = "playground-s-11-293957fa"
  region      = "us-central1"
  zone        = "us-central1-c"
  credentials = file("playground-s-11-293957fa-3fb4c2cdeeee.json")
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "windows-server-2019-dc-core-v20210608"
    }
  }
  network_interface {
    #A default network is created for all GCP Projects
    network = "default"
    access_config {

    }
  }
}

resource "google_compute_network" "vpc_network" {
  name                    = "terraform-network"
  auto_create_subnetworks = "true"
}
