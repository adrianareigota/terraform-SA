project      = "YOUR_GCP_PROJECT_ID"
region       = "us-central1"
zone         = "us-central1-a"
name         = "acme-dev-vm"
machine_type = "e2-micro"   # start with allowed type
labels = {
  env          = "dev"
  cost_center  = "payments"
}
network_tags = ["web"]
