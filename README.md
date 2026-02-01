# 🩺 Linux Incident Reproduction Script

A lightweight **Linux-first Bash script** to quickly reproduce and triage incidents when an application or service is reported as **“down”**.  
Designed with real **on-call SRE workflows** in mind.

---

## 📌 What this script does

Given a process name, the script performs **core system health checks** to identify common root causes of outages.

### Checks included

- **Process status**
  - Verifies whether the given process is running

- **Disk usage**
  - Checks root filesystem (`/`)
  - Flags usage **≥ 80%**

- **System load**
  - Evaluates **1-minute load average**
  - Flags load **> 5**

All checks are executed every time and **results are aggregated** before determining final system health.

---

## 🚦 Exit Codes

| Exit Code | Meaning |
|----------|--------|
| `0` | System is healthy |
| `2` | System is unhealthy or usage error |

Designed to be **automation-friendly** (cron jobs, wrappers, CI hooks).

---

## 🛠️ Usage

```bash
./incident_check.sh <process_name>
🛠️ Examples
./incident_check.sh ssh
./incident_check.sh nginx
./incident_check.sh fakeprocess
If no argument is provided:

USAGE: ./incident_check.sh <process_name>
📤 Sample Output
✅ Healthy system
OK: Process ssh is running
OK: Disk usage is 23%
OK: System load is 0.00
FINAL STATUS: HEALTHY
❌ Unhealthy system
CRITICAL: Process fakeprocess is NOT running
OK: Disk usage is 23%
OK: System load is 0.00
FINAL STATUS: UNHEALTHY
🔒 Constraints (Intentional)
Linux commands only

Bash scripting

Exit-code–driven health signaling

Not used by design:

Docker

Kubernetes

Cloud services

Monitoring agents

This keeps the script portable, debuggable, and interview-relevant.

🧠 Why this matters (SRE perspective)
Mimics real on-call triage

Helps reproduce incidents quickly

Distinguishes between:

Process crashes

Disk exhaustion

CPU saturation

Prioritizes clarity and correctness over clever abstractions

📂 Repository Structure
incident_check.sh   # Linux incident triage script
README.md           # Project documentation

👩‍💻 Author Notes
Built to strengthen:

Linux debugging fundamentals

Exit-code–driven automation

Incident-first thinking over tooling
