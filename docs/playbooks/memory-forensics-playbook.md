## **Step 1: Starter Playbook Content**

````markdown
# Memory Forensics Playbook

This playbook demonstrates a basic workflow for memory analysis during an incident response or threat hunting investigation.

---

## **Scenario**
A suspicious process was detected on a Linux or Windows host. We will collect memory and analyze it for malware, hidden processes, or injected code.

---

## **Step 1: Collect Memory**

### Linux
Use `LiME` or `UAC` to acquire memory:

```bash
sudo ./uac/linux/memory_collect.sh
````

### Windows

Use `FTK Imager` or `Magnet RAM Capture` to acquire a memory dump.

---

## **Step 2: Analyze Memory with Volatility3**

```bash
# Identify operating system profile
vol.py -f memory_dump.raw windows.info

# List running processes
vol.py -f memory_dump.raw windows.pslist

# Check for injected DLLs
vol.py -f memory_dump.raw windows.dlllist
```

> Tip: Replace `memory_dump.raw` with the actual memory dump filename.

---

## **Step 3: Search for Indicators of Compromise (IoCs)**

```bash
# Search for suspicious strings
vol.py -f memory_dump.raw strings | grep -i "malware"

# Check network connections
vol.py -f memory_dump.raw windows.netscan
```

---

## **Step 4: Investigate with Velociraptor (Optional)**

```bash
# Run a Velociraptor collection on the endpoint
velociraptor collection execute --client <client-id> --collection memory_artifacts
```

---

## **Step 5: Document Findings**

* Save outputs from Volatility and Velociraptor.
* Note any suspicious processes, network connections, or memory injections.
* Generate a report in the `examples/reports/` folder for reference.

---

## **References**

* [Volatility3 Documentation](https://github.com/volatilityfoundation/volatility3)
* [Velociraptor Documentation](https://docs.velociraptor.app/)
* [UAC (Linux Artifact Collector)](https://github.com/tclahr/uac)

```

---

### ✅ Step 3: Commit & Push

1. Save the file as `memory-forensics-playbook.md` in `docs/playbooks/`.  
2. Stage it in GitHub Desktop.  
3. Commit with a message like:

```

Add starter memory forensics playbook
