provider "google" {
  project = var.project_id
  region  = var.region
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  #host = "https://${google_container_cluster.primary.endpoint}"

  #token                  = data.google_client_config.default.access_token
  #cluster_ca_certificate = base64decode(data.google_container_cluster.main_cluster.master_auth[0].cluster_ca_certificate)
}

provider "helm" {
  kubernetes {
    config_path    = "~/.kube/config" 
    #host = google_container_cluster.primary.endpoint

    #token                  = data.google_client_config.default.access_token
    #cluster_ca_certificate = base64decode(data.google_container_cluster.main_cluster.master_auth[0].cluster_ca_certificate)
  }
}
