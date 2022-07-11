resource "helm_release" "traefik" {
  name       = "traefik"
  repository = "https://helm.traefik.io/traefik"
  chart      = "traefik"
  version    = "10.19.4"
  values = [file("traefik-values.yaml")]
}

#resource "helm_release" "vault" {
  #name       = "vault"
  #repository = "https://helm.releases.hashicorp.com"
  #chart      = "vault"
  #namespace  = "vault"
  #create_namespace = "true"
  #version    = "0.19.0"
  #values = [file("vault-values.yaml")]
#}

resource "helm_release" "cert_manager" {
  name       = "cert-manager"
  repository = "https://charts.jetstack.io/"
  chart      = "cert-manager"
  version    = "1.8.2"
  namespace  = "cert-manager"
  create_namespace = "true"

  set {
    name  = "installCRDs"
    value = "true"
  }
}

#resource "helm_release" "vault-default" {
  #name       = "vault"
  #repository = "https://helm.releases.hashicorp.com"
  #chart      = "vault"
  #create_namespace = "true"
  #version    = "0.19.0"
  #values = [file("vault-values.yaml")]
#}
