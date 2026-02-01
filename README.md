🩺 Linux Incident Reproduction Script

A lightweight Linux-first Bash script to quickly reproduce and triage incidents when a service is reported as “down”.
Designed with on-call SRE workflows in mind.

📌 What this script does

Given a process name, the script performs basic system health checks to help identify common root causes of outages.

Checks included:

Process status

Verifies whether the given process is running

Disk usage

Checks root filesystem (/)

Flags if usage ≥ 80%

System load

Evaluates 1-minute load average

Flags if load > 5

All checks run every time, and results are aggregated before deciding final health.

🚦 Exit Codes
Exit Code	Meaning
0	System is healthy
2	System is unhealthy or usage error

Designed to be automation-friendly (cron / wrappers / CI hooks).

🛠️ Usage
./incident_check.sh <process_name>

Examples
./incident_check.sh ssh
./incident_check.sh nginx
./incident_check.sh fakeprocess


If no argument is provided:

USAGE: ./incident_check.sh <process_name>

📤 Sample Output
Healthy system
OK: Process ssh is running
OK: Disk usage is 23%
OK: System load is 0.00
FINAL STATUS: HEALTHY

Unhealthy system
CRITICAL: Process fakeprocess is NOT running
OK: Disk usage is 23%
OK: System load is 0.00
FINAL STATUS: UNHEALTHY

🔒 Constraints (Intentional)

✅ Linux commands only

✅ Bash scripting

✅ Exit codes for health signaling

🚫 No Docker
🚫 No Kubernetes
🚫 No Cloud services
🚫 No monitoring agents

This keeps the script portable, debuggable, and interview-relevant.

🧠 Why this matters (SRE perspective)

Mimics real on-call triage

Helps reproduce incidents quickly

Distinguishes between:

Crashes

Disk exhaustion

CPU saturation

Uses fail-safe, readable logic over clever abstractions

📂 Files
incident_check.sh   # Main incident triage script
README.md           # Project documentation

👩‍💻 Author Notes

This project was built to strengthen:

Linux debugging fundamentals

Exit-code–driven automation

Incident-thinking over tooling
