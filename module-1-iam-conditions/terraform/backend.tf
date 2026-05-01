terraform {
  backend "gcs" {
    bucket = "tf-state-bq-governance-project-15293a08-1ca4-40fa-8eb"
    prefix = "module-1-iam-conditions/state"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.5.0"
}

provider "google" {
  project = var.project_id
  region  = var.region
}