## **Step 1: Starter Playbook Content**

````markdown
# Logs-Based Threat Hunting Playbook

This playbook demonstrates a basic workflow for detecting suspicious activity using system and application logs.

---

## **Scenario**
You are investigating unusual activity on a host or network. You will collect and analyze logs for suspicious behavior, including authentication anomalies, process execution, and network connections.

---

## **Step 1: Collect Logs**

### Windows
- Collect Windows Event Logs:
```powershell
# Security logs
wevtutil epl Security C:\examples\logs\Security.evtx

# System logs
wevtutil epl System C:\examples\logs\System.evtx
````

### Linux

* Collect syslogs and auth logs:

```bash
cp /var/log/syslog examples/logs/syslog.log
cp /var/log/auth.log examples/logs/auth.log
```

---

## **Step 2: Analyze Logs**

### Using grep / PowerShell

* Search for failed login attempts:

```bash
# Linux
grep "Failed password" examples/logs/auth.log
```

```powershell
# Windows
Get-WinEvent -Path C:\examples\logs\Security.evtx | Where-Object {$_.Id -eq 4625}
```

* Search for suspicious process execution:

```bash
grep -i "powershell" examples/logs/syslog.log
```

---

## **Step 3: Correlate with Known Indicators of Compromise (IoCs)**

* Compare logs with threat intelligence feeds:

```bash
grep -f iocs.txt examples/logs/syslog.log
```

* Look for known malicious IPs or hashes in network and application logs.

---

## **Step 4: Visualize or Alert**

* Optionally, import logs into SIEM tools (Splunk, ELK, Wazuh) for automated analysis and visualization.
* Generate alerts for repeated anomalies or suspicious activities.

---

## **Step 5: Document Findings**

* Save filtered logs and outputs in `examples/reports/`.
* Note timestamps, affected systems, and suspected threats.

---

## **References**

* [Windows Event Logs](https://docs.microsoft.com/en-us/windows/security/threat-protection/auditing/event-logging)
* [Linux Syslog](https://www.rsyslog.com/doc/)
* [Velociraptor Logs Collection](https://docs.velociraptor.app/)

```

---

### ✅ Step 2: Commit & Push

1. Save the file as `logs-threat-hunting-playbook.md` in `docs/playbooks/`.  
2. Stage it in GitHub Desktop.  
3. Commit with a message:

```

Add starter logs-based threat hunting playbook
