project      = "ageless-period-309812"
region       = "us-central1"
zone         = "us-central1-a"
name         = "acme-dev-vm"
machine_type = "e2-micro"   # start with allowed type "e2-micro" Fail "e2-micro"
labels = {
  env          = "dev"
  cost_center  = "payments"
}
network_tags = ["web"]
