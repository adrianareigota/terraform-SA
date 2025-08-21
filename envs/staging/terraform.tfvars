project      = "YOUR_GCP_PROJECT_ID"
region       = "us-central1"
zone         = "us-central1-b"
name         = "acme-staging-vm"
machine_type = "e2-micro"   # start with allowed type
labels = {
  env          = "staging"
  cost_center  = "payments"
}
network_tags = ["web"]
