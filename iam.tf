resource "google_service_account" "cert_manager_service_account" {
  account_id   = "cert-manager-service-account"
  display_name = "Cert Manager DNS Solver"
}

resource "google_project_iam_binding" "cert_manager_binding" {
  project = var.project_id 
  role               = "roles/dns.admin"
  members = [
    "serviceAccount:cert-manager-service-account@${var.project_id}.iam.gserviceaccount.com",
  ]
  depends_on = [google_service_account.cert_manager_service_account]
}

resource "google_service_account_key" "cert_manager_key" {
  service_account_id = google_service_account.cert_manager_service_account.name
}

resource "kubernetes_secret" "cert_manager_key" {
  metadata {
    name = "cert-manager-key"
  }
  data = {
    "credentials.json" = base64decode(google_service_account_key.cert_manager_key.private_key)
  }
}
