# Threat Hunting & Blue Team Toolkit

[![Platform](https://img.shields.io/badge/Platform-Linux%20|%20Windows-blue)](https://github.com/EhsanCreator/threat-hunting-tools)
[![GitHub stars](https://img.shields.io/github/stars/EhsanCreator/threat-hunting-toolkit?style=social)](https://github.com/EhsanCreator/threat-hunting-tools/stargazers)

A curated toolkit of tools and playbooks for **digital forensics, threat hunting, and blue team operations**.

---

## 📌 Table of Contents

- [Tools](#%F0%9F%94%8D-tools)
- [Usage](#%F0%9F%9A%80-usage)
- [Installation](#%F0%9F%9B%80%EF%B8%8F-installation)
- [Roadmap](#%F0%9F%93%8C-roadmap)
- [Contributing](#%E2%9D%91-contributing)

---

## 🔍 Tools

### Memory & Forensics
- [Volatility](https://github.com/volatilityfoundation/volatility3) – Memory forensics framework.
- [Cyber Triage](https://www.cybertriage.com/) – Incident response and triage tool.
- [Velociraptor](https://github.com/Velocidex/velociraptor) – Endpoint visibility and digital forensics platform.
- [UAC (Linux Artifact Collector)](https://github.com/tclahr/uac) – Collects forensic artifacts on Linux systems.

### Threat Hunting
- [THOR](https://www.nextron-systems.com/thor/) – Full-featured scanner for forensic artifacts and IOC detection.
- [Velociraptor](https://github.com/Velocidex/velociraptor) – Also useful for live threat hunting.

---

## 🚀 Usage

Clone this repository:

```bash
git clone https://github.com/EhsanCreator/threat-hunting-toolkit.git
cd threat-hunting-toolkit
````

Follow the instructions below for your platform to set up the tools.

---

## 🛠️ Installation

### Linux

```bash
cd scripts
chmod +x install.sh
./install.sh
```

> Installs Python, Git, Volatility3, Velociraptor, and UAC.
> THOR is commercial and must be downloaded manually.

### Windows

```powershell
# Open PowerShell as Administrator
cd path\to\threat-hunting-toolkit\scripts
.\install.ps1
```

> Installs Python, Git, Velociraptor, and Volatility3.
> THOR must be downloaded manually.
> UAC is Linux-only.

---

## 📂 Folder Structure Overview

* **docs/playbooks/** – Step-by-step playbooks for memory forensics, log analysis, and endpoint investigation.
* **docs/case-studies/** – Example forensic cases demonstrating toolkit usage.
* **examples/** – Sample memory dumps, logs, and reports.
* **scripts/** – Installation scripts for Linux and Windows.
* **tools/** – Configuration files, rules, or helpers for your tools.

---

## 📌 Roadmap

### 🔹 Phase 1: Foundation (Current)

* [x] Repository creation
* [x] README with core tools
* [x] Folder structure with `.gitkeep`

### 🔹 Phase 2: Documentation

* [x] Starter playbooks for memory forensics, logs, and endpoints
* [x] Starter case study
* [x] Examples folder with README

### 🔹 Phase 3: Automation

* [x] `install.sh` for Linux
* [x] `install.ps1` for Windows
* [ ] Dockerization for easy deployment

### 🔹 Phase 4: Practical Scenarios

* [ ] Additional playbooks (Sigma rules, malware analysis)
* [ ] Expanded case studies

### 🔹 Phase 5: Expansion

* [ ] Add more tools (OSQuery, Sysmon configs)
* [ ] SIEM integrations (Splunk, ELK, Wazuh)
* [ ] Automate collection & reporting pipelines

### 🔹 Phase 6: Community

* [ ] Contribution guidelines
* [ ] Pull request workflow
* [ ] Feature requests & issues organization

---

## 🤝 Contributing

Contributions are welcome!

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/your-feature`)
3. Make your changes
4. Commit (`git commit -m "Add feature"`)
5. Push (`git push origin feature/your-feature`)
6. Open a Pull Request
