# Конфигурации тачек
variable "vm_resources_srv" {
  type = object({
    cores         = number
    memory        = number
    disk_size     = number
    core_fraction = number
    preemptible   = bool
  })
  default = {
    cores         = 2
    memory        = 2
    disk_size     = 20
    core_fraction = 20
    preemptible   = true
  }
}
variable "srv_internal_ip" {
  default     = "10.0.0.11"
  description = "Внутренний IP Zabbix-сервера"
}
variable "vm_resources_ws1" {
  type = object({
    cores         = number
    memory        = number
    disk_size     = number
    core_fraction = number
    preemptible   = bool
  })
  default = {
    cores         = 2
    memory        = 1
    disk_size     = 10
    core_fraction = 20
    preemptible   = true
  }
}
variable "vm_resources_kotenkovra1" {
  type = object({
    cores         = number
    memory        = number
    disk_size     = number
    core_fraction = number
    preemptible   = bool
  })
  default = {
    cores         = 2
    memory        = 1
    disk_size     = 10
    core_fraction = 20
    preemptible   = true
  }
}
variable "vm_resources_kotenkovra2" {
  type = object({
    cores         = number
    memory        = number
    disk_size     = number
    core_fraction = number
    preemptible   = bool
  })
  default = {
    cores         = 2
    memory        = 1
    disk_size     = 10
    core_fraction = 20
    preemptible   = true
  }
}
variable "ws1_internal_ip" {
  default     = "10.0.0.22"
  description = "Внутренний IP агента ws-01"
}
variable "kotenkovra1_internal_ip" {
  default     = "10.0.0.23"
  description = "Внутренний IP агента kotenkovra1"
}
variable "kotenkovra2_internal_ip" {
  default     = "10.0.0.24"
  description = "Внутренний IP агента kotenkovra2"
}
variable "image_id_zabbix" {
  default = "fd89dboump1l490q0osc" # Debian 11
}

variable "image_id_ws" {
  default = "fd89dboump1l490q0osc" # Debian 11
}
# Обьявляем переменные
variable "token" {
  description = "Yandex Cloud OAuth token"
  type        = string
  sensitive   = true
}
variable "cloud_id" {
  description = "Yandex Cloud cloud ID"
  type        = string
}
variable "folder_id" {
  description = "Yandex Cloud folder ID"
  type        = string
}
variable "ssh_key" {
  description = "Публичный SSH-ключ для доступа к ВМ"
  type        = string
}
variable "region" {
  type    = string
  default = "ru-central1"
}
variable "zone" {
  type    = string
  default = "ru-central1-a"
}