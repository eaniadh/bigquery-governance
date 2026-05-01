# PATTERN 1 — Dataset IAM Bindings
# Grants dataset-specific direct access to SAs without IAM condition


# finance-analyst-sa → finance_dataset only
resource "google_bigquery_dataset_iam_member" "finance_analyst_access" {
  project    = var.project_id
  dataset_id = var.finance_dataset
  member     = "serviceAccount:${var.finance_analyst_sa}"
  role       = "roles/bigquery.dataViewer"
}

# marketing-analyst-sa  -> marketing_dataset only
resource "google_bigquery_dataset_iam_member" "marketing_analyst_access" {
  project    = var.project_id
  dataset_id = var.marketing_dataset
  role       = "roles/bigquery.dataViewer"
  member     = "serviceAccount:${var.marketing_analyst_sa}"
}

# finance-analyst-sa -> BQ Job user at the project level
# Required to actually RUN queries — dataViewer alone is not enough

resource "google_project_iam_member" "finance-analyst-job-user" {
  project = var.project_id
  member  = "serviceAccount:${var.finance_analyst_sa}"
  role    = "roles/bigquery.jobUser"
}

resource "google_project_iam_member" "marketing-analyst-job-user" {
  project = var.project_id
  member  = "serviceAccount:${var.marketing_analyst_sa}"
  role    = "roles/bigquery.jobUser"
}