resource "proxmox_vm_qemu" "minecraft_server" {
  count = 1
  name = var.vm_name
  target_node = "pve"

  clone = "ubuntu-cloud"

  agent = 0
  os_type = "cloud-init"
  cores = var.cores
  memory = var.memory
  cpu = "host"
  boot = "order=scsi0"
  scsihw = "virtio-scsi-pci"

  ipconfig0 = "ip=${var.ip}/24,gw=192.168.0.1"

  sshkeys = file("/home/test/.ssh/id_rsa.pub")

  disks {
    scsi {
      scsi0 {
        disk {
          storage = "local-lvm"
          size = var.disk_size
        }
      }
    }
    ide {
      ide2 {
        cloudinit {
          storage = "local-lvm"
        }
      }
    }
  }
}