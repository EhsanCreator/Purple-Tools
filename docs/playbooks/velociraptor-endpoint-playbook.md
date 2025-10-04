# Velociraptor Endpoint Investigation Playbook

This playbook demonstrates a basic workflow for investigating endpoints using Velociraptor.

---

## **Scenario**
A host is suspected of compromise. You will collect system artifacts, processes, and network information from the endpoint for analysis.

---
## **Step 1: Setup Velociraptor Client**

- Ensure Velociraptor server is running and accessible.
- On the endpoint, install the Velociraptor client if not already installed:

```bash
# Linux
wget https://github.com/Velocidex/velociraptor/releases/latest/download/velociraptor-v0.8.4-linux-amd64.deb
sudo dpkg -i velociraptor-v0.8.4-linux-amd64.deb

# Windows
Download the Velociraptor client from the server or release page.
````

---

## **Step 2: Collect Endpoint Artifacts**

* Example: Collect running processes and scheduled tasks:

```bash
# Linux
velociraptor collection execute --client <client-id> --collection linux.system.processes

# Windows
velociraptor collection execute --client <client-id> --collection windows.system.processes
```

* Collect network connections and autoruns:

```bash
velociraptor collection execute --client <client-id> --collection windows.system.network
velociraptor collection execute --client <client-id> --collection windows.system.autoruns
```

---

## **Step 3: Analyze Artifacts**

* Check for suspicious processes, hidden autoruns, or unusual network connections.
* Export outputs to `examples/reports/` for documentation and correlation.

---

## **Step 4: Correlate with Threat Intelligence**

* Compare findings with known IoCs.
* Identify any patterns indicating malware, lateral movement, or persistence.

---

## **Step 5: Document Findings**

* Save reports with timestamped filenames.
* Include screenshots or relevant excerpts in `docs/case-studies/` if needed.

---

## **References**

* [Velociraptor Documentation](https://docs.velociraptor.app/)
* [Endpoint Threat Hunting Basics](https://www.sans.org/white-papers/403/)

```
