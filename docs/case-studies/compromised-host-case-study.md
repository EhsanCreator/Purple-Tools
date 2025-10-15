# Compromised Host - Forensic Case Study

This case study demonstrates a step-by-step investigation of a compromised host using the purple Team Toolkit.

---

## **Scenario**
A Linux workstation in the corporate network shows unusual outbound network traffic. The security team suspects malware or unauthorized access.

---

## **Step 1: Collect Evidence**

- **Memory Dump:** Use UAC to collect memory from the Linux host.
```bash
sudo ./uac/linux/memory_collect.sh
````

* **Logs:** Collect authentication and system logs:

```bash
cp /var/log/auth.log examples/logs/auth.log
cp /var/log/syslog examples/logs/syslog.log
```

* **Endpoint Artifacts:** Collect running processes and network connections using Velociraptor:

```bash
velociraptor collection execute --client <client-id> --collection linux.system.processes
velociraptor collection execute --client <client-id> --collection linux.system.network
```

---

## **Step 2: Memory Forensics**

* Analyze memory with Volatility3:

```bash
vol.py -f memory_dump.raw linux.pslist
vol.py -f memory_dump.raw linux.lsof
```

* Look for suspicious processes or injected code.

---

## **Step 3: Log Analysis**

* Search logs for failed logins or unusual activity:

```bash
grep "Failed password" examples/logs/auth.log
grep -i "ssh" examples/logs/syslog.log
```

* Identify anomalies in process execution or network activity.

---

## **Step 4: Endpoint Investigation**

* Use Velociraptor to correlate processes with network connections:

```bash
velociraptor collection execute --client <client-id> --collection linux.system.processes
velociraptor collection execute --client <client-id> --collection linux.system.network
```

* Identify suspicious processes that match patterns in memory and logs.

---

## **Step 5: Document Findings**

* Save outputs to `examples/reports/`.
* Note timestamps, affected hosts, suspicious processes, network connections, and potential malware.
* Generate a summary report for management or the SOC team.

---

## **Step 6: Follow-Up Actions**

* Isolate compromised host.
* Update detection rules based on IoCs found.
* Conduct network-wide search for similar activity.
* Improve monitoring and alerting based on findings.

---

## **References**

* [Volatility3 Documentation](https://github.com/volatilityfoundation/volatility3)
* [Velociraptor Documentation](https://docs.velociraptor.app/)
* [Linux UAC](https://github.com/tclahr/uac)
