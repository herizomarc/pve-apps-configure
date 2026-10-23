# ================================
# HARDENED  ANSIBLE RUNTIME ENGINE
# ================================
FROM docker.io/alpine/ansible:2.21.0

#  Install system dependencies and cryptographic transport layers
RUN apk add --no-cache \
    python3 \
    py3-pip \
    ca-certificates \
    openssh-client

#  Inject SDK python blocks required for Proxmox REST API communication
RUN pip3 install --no-cache-dir --break-system-packages \
    requests \
    proxmoxer

#  Enforce upfront download of the verified official community collection
RUN ansible-galaxy collection install community.proxmox

# Set clean execution boundaries
WORKDIR /workspace
#force rerun
