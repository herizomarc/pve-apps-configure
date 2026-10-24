# Automated Enterprise Configuration Engine 🛡️

A dynamic, continuous configuration management repository tasked with the zero-trust deployment, compliance, and cryptographic bootstrap initialization of core sovereign applications.

## 🛠️ Architecture & Tech Stack
* **Configuration Tool:** Ansible `2.21.0` embedded inside custom hardened OCI containers.
* **Isolation Boundary:** Container workflows explicitly restrict volume mounts to code files (`site.yml`, `inventory`, `roles`, `group_vars`), strictly protecting the host Runner `.git/` runtime metadata.
* **Secret Storage:** Global environment data encrypted locally via native `group_vars/all.yml` structures.

## 👑 Advanced GitOps Operations
* **Dynamic Inventory Discovery:** Powered by the modern `community.proxmox.proxmox` plugin. It completely eliminates static `hosts.ini` files. Hotes are tracked dynamically via live hypervisor REST API queries.
* **Zero-Trust Memory Streaming:** Private cluster access tokens are safely cut in memory (RAM) via pipeline string processing and streamed straight down into unprivileged container pods using `--env-file`.
* **Day-0 vs Day-1 Boundary Isolation:** Automatically handles Day-0 pristine application bootstrapping (`v1/sys/health` evaluation) and streams master unseal shares **once** safely to secure build consoles, leaving Day-1 unseal operations to manual, out-of-band security ceremonies.
