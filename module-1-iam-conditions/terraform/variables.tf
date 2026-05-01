variable "project_id" {
  type        = string
  description = "The GCP project ID"
}

variable "region" {
  type        = string
  description = "GCP project region name"
  default     = "asia-south1"
}

variable "environment" {
  type        = string
  description = "Deployment environment (dev or prod)"
  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "Environment must be dev or prod."
  }
}

variable "finance_analyst_sa" {
  type        = string
  description = "Finance analyst service account email"
}

variable "marketing_analyst_sa" {
  type        = string
  description = "Marketing analyst service account email"
}

variable "finance_dataset" {
  type        = string
  description = "Finance BQ dataset ID"
}

variable "marketing_dataset" {
  type        = string
  description = "Marketing BQ dataset ID"
}

