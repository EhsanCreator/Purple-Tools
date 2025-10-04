# Examples and Sample Data

This folder contains sample files and outputs used for testing, learning, and demonstrating workflows in the Threat Hunting & Blue Team Toolkit.

---

## **Folder Structure**

- **memory-dumps/** – Memory dump files used for forensic analysis.  
  Example: `memory-dump1.raw`

- **logs/** – Collected system or application logs for analysis.  
  Example: `auth.log`, `syslog.log`, `Security.evtx` (Windows)

- **reports/** – Generated reports from playbooks or analysis.  
  Example: `memory-analysis-report.txt`, `endpoint-investigation-report.md`

---

## **How to Use**

1. Place any sample memory dumps, logs, or reports in the appropriate subfolder.  
2. Follow the playbooks in `docs/playbooks/` to analyze these examples.  
3. After analysis, save your outputs in `reports/` with descriptive names for reference.

---

## **Tips**

- Use realistic but **non-sensitive data** for examples.  
- Keep filenames descriptive to make it easy to follow the workflow.  
- Maintain the folder structure for consistency and easier collaboration.
