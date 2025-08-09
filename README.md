# Red-vs-Blue Simulator

A **sandboxed Red Team vs Blue Team learning platform** that uses Docker to spin up intentionally vulnerable environments for attack simulation and defensive countermeasures. This lab allows ethical learners to practice real-world security scenarios in a safe and isolated environment.

---

##  Overview

- **Red Team**: Simulates adversarial behaviour *at a high level* (e.g., running MITRE Caldera or Atomic Red Team commands mapped to ATT&CK techniques).
- **Blue Team**: Runs defensive controls such as NGINX + ModSecurity WAF configurations, iptables baselines, and collects telemetry via the ELK stack (Elasticsearch, Logstash, Kibana).
- **Goal**: Offer a full-cycle threat simulation lab—attack orchestration tools (without exploit payloads), telemetry collection, real-time alerts, dashboards, and rule tuning for detection.

---

##  Architecture

The environment consists of these primary components brought up via Docker Compose:

- `juice-shop`: Vulnerable web application (OWASP Juice Shop) for practice and CTF-style exploitation.
- `nginx-waf`: NGINX reverse proxy with ModSecurity (OWASP CRS) to implement defensive layers.
- `elasticsearch`, `logstash`, `kibana`: The observability stack for log ingestion, search, and dashboard visualization.
- (Optional) `caldera` or `atomic`: Adversary emulation/orchestration frameworks to drive simulated attack behaviors—no exploit code included.

---

##  Getting Started

```bash
git clone https://github.com/Nj130/red-vs-blue-sim.git
cd red-vs-blue-sim
docker compose up -d
