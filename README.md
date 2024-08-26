# Minecraft Server VM Automation

This project automates the creation and management of Minecraft server virtual machines (VMs) with customizable specifications. It uses Terraform and Ansible to provision and configure VMs on a Proxmox server. 

## Features

- **Automated VM Creation:** Easily create Minecraft server VMs with specified resources (CPU, RAM, Disk, IP).
- **VM Removal:** Remove Minecraft server VMs when they are no longer needed.
- **Proxmox Integration:** Leverages Proxmox virtualization to manage VMs efficiently.

## Prerequisites

- **Proxmox VE**: A running instance of Proxmox where the VMs will be provisioned.
- **Terraform**: Version 3.0.1-rc3 or higher is required.
- **Ansible**: Used for orchestration and VM lifecycle management.

## Setup Instructions

1. **Clone the repository:**

   ```bash
   https://github.com/jzodn/minecraft-server-provisioning.git
   cd minecraft-server-provisioning
   ```
2. **Create the Terraform provider file:**
    
    Create a file named provider.tf in the root of the project with the following content:
   ```
   terraform {
      required_providers {
        proxmox = {
          source = "telmate/proxmox"
          version = "3.0.1-rc3"
        }
      }
    }
    
    provider "proxmox" {
      pm_api_url = "URL of proxmox server"
      pm_api_token_id = "proxmox API token ID"
      pm_api_token_secret = "proxmox API secret"
    }
    ```
    

## Usage
### Creating a Minecraft Server VM
To create a new Minecraft server VM, use the following command:
   ```bash
ansible-playbook create_vm.yml -e "vm_name={vm name} cores={no. cores} memory={RAM MB} disk_size={disk size, GB} ip={ip}"
```

### Removing a Minecraft Server VM
To remove an existing Minecraft server VM, use the following command:
   ```bash
ansible-playbook remove_vm.yml -e "vm_name={vm name} ip={ip}"
```

