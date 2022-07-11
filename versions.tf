terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.19.0"
    }

    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.11.0"
    }

    helm = {
      source = "hashicorp/helm"
      version = "2.5.1"
    }
  }

  backend "gcs" {
    bucket  = "personal-tf-state"
  }

  required_version = ">= 0.14"
}

