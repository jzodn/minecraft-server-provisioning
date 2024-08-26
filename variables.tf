variable "server_count" {
  description = "Number of Minecraft servers to deploy"
  type        = number
  default     = 1
}

variable "cores" {
  description = "Number of CPU cores for each server"
  type        = number
  default     = 2
}

variable "memory" {
  description = "Amount of memory for each server (in MB)"
  type        = number
  default     = 2048
}

variable "disk_size" {
  description = "Disk size for each server (in GB)"
  type        = number
  default     = 10
}

variable "vm_name" {
  description = "The name to give the vm"
  type        = string
  default     = "minecraft-server"
}

variable "ip" {
  description = "The IP to give the vm"
  type        = string
  default     = "192.168.0.111"
}