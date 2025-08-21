# GitHub → HCP Terraform → GCP: Fast Demo

This repo powers a **6–8 min** demo showing a GitHub-driven workflow with **HCP Terraform** deploying a small **GCE instance** on **GCP**.

## What you’ll show
- VCS-driven runs: GitHub commit → **Plan → Policy Check (Sentinel) → Apply** in HCP Terraform
- Two environments via workspaces: **dev** and **staging** (same module, different vars)
- **Remote state & locking**
- **Sentinel guardrail**: block disallowed `machine_type` (e.g., `n2-standard-8`), allow smaller types (`e2-micro`, `e2-small`)
- Drift detection: change something in GCP Console and show Terraform detecting it

## Repo structure
```
/modules/compute_instance/
/envs/dev/
/envs/staging/
/policies/
```

## Quick start
1) **Create a GitHub repo** with these files.
2) In **HCP Terraform** → *Settings → VCS Providers* → add **GitHub** and authorize your repo.
3) Create workspaces:
   - `acme-dev`      → working directory: `/envs/dev`
   - `acme-staging`  → working directory: `/envs/staging`
4) In each workspace add **Environment Variables** (Sensitive):
   - `GOOGLE_CREDENTIALS` = contents of your JSON service account key
   - Optional: `TF_LOG` = `INFO` during rehearsals
5) Attach a **Policy Set** to the org or the two workspaces (policy path `/policies`), enforcement **soft-mandatory**.
6) Commit to GitHub → watch the run in HCP Terraform.

## Demo flow (script-friendly)
1. Show the module in `/modules/compute_instance` and the two envs.
2. In `acme-dev` run with `machine_type = "e2-micro"` → **PASS**.
3. Change to `machine_type = "n2-standard-8"` → run triggers **POLICY: FAIL**.
4. Change to `machine_type = "e2-small"` → **PASS** and **Apply**.
5. (Optional) In GCP Console stop the VM or edit a label → re‑Plan to show **drift**.

## IAM needed for the service account (minimal for demo)
- `roles/compute.admin`
- `roles/iam.serviceAccountUser`
- `roles/compute.instanceAdmin.v1`
Grant only what you need for the demo in a non‑prod project.

## Notes
- Keep secrets out of code/state. Use env var `GOOGLE_CREDENTIALS` (Sensitive) in the workspace.
- If the webhook is slow, click **Queue plan** and narrate “I’m triggering a plan to save time”.
- Machine types allowlist/denylist is controlled by Sentinel in `/policies/`.
