# Automated Enterprise Configuration Engine 🛡️

A dynamic, continuous configuration management repository driven by Ansible to provision, secure, and bootstrap core sovereign applications on top of Red Hat Enterprise Linux 9 (RHEL 9) nodes.

## 🛠️ Architecture & Tech Stack

* **Configuration Tool:** Ansible encapsulated within hardened unprivileged OCI runtime containers.
* **Target Application:** OpenBao Server (High-Performance Sovereign Open-Source Fork of HashiCorp Vault).
* **Storage & Compliance:** Clustered Raft database engine on a dedicated 15GB XFS volume, hardened via `firewalld` and custom SELinux mappings.

## 👑 Advanced GitOps Operations

* **Dynamic Inventory Discovery:** Uses the `community.proxmox.proxmox` plugin to eliminate static host files via live hypervisor REST API queries.
* **Zero-Trust & PKI Infrastructure:** Streams tokens safely in memory and compiles custom X.509 TLS handshakes with multi-layered Subject Alternative Names (SAN) for health checks.
* **State Protection:** Implements pre-configuration purge blocks to redirect active runtime configurations directly into `/etc/openbao/openbao.conf`.

## 🔐 Day-0 Automated Bootstrapping & Local Sealing

Implements an in-memory Day-0 initialization sequence during Unified Phase 5, isolating automation blocks from master keys to prevent cleartext leakage. The raw initialization JSON payload is captured in transient memory and written securely to `/root/openbao-master-keys.json` (`0400` permissions).

---

## 🔓 Accessing Master Keys for Manual Unsealing

To retrieve the credentials locally on the target RHEL 9 VM as root:

```bash
sudo cat /root/openbao-master-keys.json
```
