resource "google_cloud_run_service" "default" {
    name = "level-up-pro-srv"
    location = var.region

    template {
        spec {
          containers {
            image = "us-docker.pkg.dev/cloudrun/container/hello"
          }
        }
    }
}

resource "google_cloud_run_service_iam_binding" "binding" {
    service = google_cloud_run_service.default.name
    role = "roles/viewer"
    members = ["allAuthenticatedUsers"]
  
}