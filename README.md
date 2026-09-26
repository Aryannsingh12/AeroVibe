
# AeroVibe: Immersive Acoustic Reality Ecosystem Suite
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Infrastructure: Terraform](https://img.shields.io/badge/IaC-Terraform-7B42BC?logo=terraform)](https://www.terraform.io/)
[![Orchestration: Kubernetes](https://img.shields.io/badge/Orchestration-Kubernetes-326CE5?logo=kubernetes)](https://kubernetes.io/)
[![Telemetry: Prometheus](https://img.shields.io/badge/Telemetry-Prometheus-E6522C?logo=prometheus)](https://prometheus.io/)

AeroVibe is an enterprise-grade, highly observed multi-tier microservices platform designed with a sleek, minimalist product showcase user interface mimicking premium tech landing pages. The entire backend ecosystem is built to replicate top-tier production environments using local cloud virtualization, configuration hardening, dynamic cluster scaling, and time-series telemetry scraping.

---

## 🏛️ Comprehensive System Architecture

The AeroVibe ecosystem is split into four distinct architectural operational layers:

```text
[ Slim, High-End UX/UI Frontend ] <───> [ Observed Node.js Backend API ]
               │                                       │
               ▼                                       ▼
    ┌───────────────────────┐               ┌───────────────────────┐
    │ Telemetry & Scrapers  │               │ Infrastructure & IaC  │
    │  (Prometheus/Grafana) │               │  (Ansible/Terraform)  │
    └───────────────────────┘               └───────────────────────┘

```

1. **The Core App Layer:** A pixel-perfect dark-theme spatial audio product page built on Nginx serving fluid, minimalist interactive states, connected directly to an asynchronous Node.js backend telemetry tracker.
2. **Local Cloud Virtualization:** Provisioned using **Terraform** to redirect secure AWS ECR container registry schemas directly into an isolated local **Floci AWS** simulator workspace.
3. **Configuration & Hardening:** Managed via **Ansible Playbooks** to automate directory security boundaries, variables orchestration, and verification parameters across live nodes.
4. **Orchestration & Autoscaling:** Built inside a self-healing **Kubernetes** environment utilizing automated Horizontal Pod Autoscalers (HPA) to dynamically scale application workloads between 2 to 10 pods when traffic spikes.
5. **Full Observability Matrix:** Real-time data aggregation via **Prometheus** capturing native application variables (processed transactions, failure counts) and cluster-level performance graphs visualized inside a dark-themed **Grafana** dashboard interface.

---

##  Technological Blueprint Stack

* **Frontend Engine:** Node.js, Nginx, Tailwind CSS, FontAwesome, JavaScript Long-Polling
* **Backend Framework:** Node.js Express API, Native Prometheus Client (`prom-client`)
* **Infrastructure as Code (IaC):** Terraform (AWS Provider Redirect Rules)
* **Configuration Automation:** Ansible (Configuration Playbooks & Environment Injections)
* **Containerization:** Docker, Docker Compose, Multi-Stage Optimized Builds
* **Cluster Management:** Kubernetes Manifests (Deployments, ClusterIP Services, LoadBalancers, HPA)
* **System Telemetry:** Prometheus Scraping Engine, Grafana Dark Theme Analytical Interface

---

##  Repository Workspace Blueprint

```text
AeroVibe/
├── app-frontend/
│   ├── index.html          # UI Layout & Telemetry Script
│   └── dockerfile          # Production Nginx Container Configuration
├── app-backend/
│   ├── server.js           # Express REST API Engine & Custom Metrics Registry
│   ├── package.json        # Service System Node.js Dependencies
│   └── dockerfile          # Multi-Stage Optimized Hardened Build
├── iac-terraform/
│   └── main.tf             # Local Provider Configuration & AWS ECR Blueprints
├── config-ansible/
│   ├── inventory.ini       # Automated Target Endpoint Declarations
│   └── deploy-spec.yml     # Node Hardening & Environment Injection Playbook
├── k8s-manifests/
│   └── aerovibe-cluster.yaml # HA Deployments, Cluster Services, & Autoscaling (HPA)
├── telemetry-data/
│   └── prometheus.yml      # Scraping Frequency and Metric Targets Configuration
└── docker-compose.yml      # Base Workspace Orchestrator (Floci AWS, Prometheus, Grafana)

```

---

##  Local Workspace Initialization

To execute the core telemetry sandbox engines on your local environment, follow this operational runbook:

```bash
# 1. Boot up the Core Cloud Sandbox & Monitoring Engines
docker compose up -d

# 2. Navigate to the Infrastructure Folder and Provision ECR Registries
cd iac-terraform
terraform init
terraform apply -auto-approve

# 3. Verify Local Services Availability
# ➔ Prometheus Dashboard: http://localhost:9090
# ➔ Grafana Visualization Studio: http://localhost:3000 (Credentials: admin/admin)
# ➔ Floci Local AWS Endpoint: http://localhost:4566

```

---

##  Enterprise Production & Security Standards Implemented

* **Multi-Stage Container Layering:** Backend Dockerfiles utilize multi-stage compilations to strip execution tools, reducing the production image storage overhead and removing potential server exploit vectors.
* **Declarative Idempotency:** The entire infrastructure profile is locked down inside Git-tracked code manifests, preventing configuration drift across the cluster lifecycle.
* **Isolated Resource Control:** Kubernetes configurations strictly define maximum `limits` and baseline `requests` for CPU and Memory, ensuring zero pod degradation or noisy-neighbor issues during heavy mock traffic stress injection tests.


#### I used Floci's AWS to fast run the process on local machine, if you want to follow along, go ahead. It will give you faster responses. But, its better to use AWS technology for this project!



