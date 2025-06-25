# 🏢 Full Enterprise Linux Environment Deployment

A structured and secure Linux infrastructure deployment for internal company use, built entirely using modular shell scripts and system administration best practices.

---

## 📌 Project Overview

This project simulates the deployment of an enterprise-grade Linux server environment for a mid-size company, covering everything from system setup to automation and security hardening.

### 🔧 Key Features
- Static IP configuration and hostname setup
- Department-based user/group creation and access control
- LVM-backed directory structure per department
- ACLs and disk quotas for secure file access
- Apache web server hosting an internal portal
- System automation with Bash scripts, cron, and at
- Security hardening with SELinux, SSH, firewall, and sudo

---

## 📁 Project Structure

Each phase of the project is separated into its own shell script for clarity and modularity:

| Script | Description |
|--------|-------------|
| `phase1_system_prep.sh` | System hostname, static IP, user & group setup |
| `phase2_directory_permissions.sh` | Department directories, permissions & ACLs |
| `phase3_lvm_setup.sh` | LVM creation, mount setup, disk quotas |
| `phase4_security_hardening.sh` | Sudo, SSH restrictions, firewall, SELinux |
| `phase5_web_portal.sh` | Apache installation and internal index.html |
| `phase6_automation.sh` | Backup script, cron job, system messages |
| `phase7_troubleshooting.sh` | Log inspection & recovery instructions |

---

## 🚀 Technologies Used

- **Linux (RHEL/CentOS/AlmaLinux)**
- **Bash scripting**
- **LVM, XFS, disk quotas**
- **SELinux, firewalld, SSH**
- **Apache HTTPD**
- **cron & atd (job scheduling)**
- **ACLs & permissions management**

---

## 📸 Screenshots & Output (Optional)

> You can include screenshots of:
> - The directory permissions (`ls -l`)
> - `lsblk` showing LVMs mounted
> - Apache web page in browser
> - cron logs or `/var/log/messages`

---

## ✅ How to Use

```bash
# Make scripts executable
chmod +x phase*.sh

# Run each script in order (as root or sudo-enabled user)
./phase1_system_prep.sh
./phase2_directory_permissions.sh
