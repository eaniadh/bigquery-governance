output "finance_analyst_dataset_access" {
  description = "IAM binding etag for finance analyst on finance dataset"
  value       = google_bigquery_dataset_iam_member.finance_analyst_access.etag
}

output "marketing_analyst_dataset_access" {
  description = "IAM binding etag for marketing analyst on marketing dataset"
  value       = google_bigquery_dataset_iam_member.marketing_analyst_access.etag
}

output "finance-analyst-job-user" {
  description = "IAM binding etag for finance analyst job user at project level"
  value       = google_project_iam_member.finance-analyst-job-user.etag
}

output "marketing-analyst-job-user" {
  description = "IAM binding etag for marketing analyst job user at project level"
  value       = google_project_iam_member.marketing-analyst-job-user.etag
}

output "project_id" {
  description = "GCP Project ID"
  value       = var.project_id
}
