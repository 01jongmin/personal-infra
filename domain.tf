resource "google_compute_address" "static-ip" {
  name = "traefik-entrypoint"
  address_type = "EXTERNAL"
  region = var.region
  network_tier = "STANDARD"
}

resource "google_dns_managed_zone" "prod" {
  name        = "prod-zone"
  dns_name    = "jongmin.space."
  description = "Example DNS zone"
}

resource "google_dns_record_set" "website" {
  name         = "${google_dns_managed_zone.prod.dns_name}"
  managed_zone = google_dns_managed_zone.prod.name
  type         = "A"
  ttl          = 300

  rrdatas = [google_compute_address.static-ip.address]
}

resource "google_dns_record_set" "wildcard" {
  name         = "*.${google_dns_managed_zone.prod.dns_name}"
  managed_zone = google_dns_managed_zone.prod.name
  type         = "A"
  ttl          = 300

  rrdatas = [google_compute_address.static-ip.address]
}
