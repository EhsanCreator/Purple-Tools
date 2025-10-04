# Threat Hunting & Blue Team Toolkit

A curated list of tools for digital forensics, threat hunting, and blue team operations.

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

Follow the instructions below to set up the tools for your platform.

---

## 🛠️ Installation

### Linux

1. Open a terminal and navigate to the `scripts` folder:

```bash
cd scripts
```

2. Make the install script executable:

```bash
chmod +x install.sh
```

3. Run the script:

```bash
./install.sh
```

> This script will install Python, Git, dependencies, Volatility3, Velociraptor, and UAC.
> THOR is commercial, so follow the link to download it manually.

### Windows

1. Open PowerShell **as Administrator**.
2. Navigate to the `scripts` folder:

```powershell
cd path\to\threat-hunting-toolkit\scripts
```

3. Run the installation script:

```powershell
.\install.ps1
```

> The script installs Python, Git, Velociraptor, and Volatility3.
> THOR must be downloaded manually, and UAC is Linux-only.

---

## 📌 Roadmap

### 🔹 Phase 1: Foundation (Current)

* [x] Create initial repository
* [x] Add README with core tools
* [x] Add folder structure with `.gitkeep`

### 🔹 Phase 2: Documentation

* [ ] Add basic usage guides for each tool
* [ ] Add quick-start commands or cheat sheets
* [ ] Create `docs/` folder for extended documentation

### 🔹 Phase 3: Automation

* [x] Add `install.sh` (Linux)
* [x] Add `install.ps1` (Windows)
* [ ] Dockerize tools for easy deployment

### 🔹 Phase 4: Practical Scenarios

* [ ] Provide sample forensic cases
* [ ] Write threat hunting playbooks
* [ ] Add “How-To” examples for blue teamers

### 🔹 Phase 5: Expansion

* [ ] Add more tools (Sysmon configs, Sigma rules, OSQuery)
* [ ] Add SIEM integrations (Splunk, ELK, Wazuh)
* [ ] Build automation pipelines

### 🔹 Phase 6: Community

* [ ] Set contribution guidelines
* [ ] Accept pull requests for new tools/playbooks
* [ ] Organize issues as “feature requests” or “tool suggestions”

---

## 🤝 Contributing

Contributions are welcome!
Fork the repo → create a new branch → submit a pull request.

---

## 📜 License

This project is licensed under the [MIT License](LICENSE).

```

---

This version now:

- Clearly explains **how to install tools on Linux and Windows**.  
- Keeps your **roadmap** visible and actionable.  
- Mentions limitations (THOR and UAC).  
- Guides users for **future contributions**.  

---

If you want, I can **also suggest a small `examples/README.md` template** for your `docs/` and `examples/` folders, so users immediately know what each folder is for. This will make your repo **very professional and beginner-friendly**.  

Do you want me to do that next?
```
