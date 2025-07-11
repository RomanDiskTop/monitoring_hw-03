resource "yandex_compute_instance" "srv_zbx1" {
  name        = "srv-zbx1"
  hostname    = "srv-zbx1"
  platform_id = "standard-v1"
  zone        = var.zone

  resources {
    cores         = var.vm_resources_srv.cores
    memory        = var.vm_resources_srv.memory
    core_fraction = var.vm_resources_srv.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id_zabbix
      size     = var.vm_resources_srv.disk_size
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.default.id
    nat       = true # Публичный IP
    ip_address = var.srv_internal_ip
  }

  scheduling_policy {
    preemptible = var.vm_resources_srv.preemptible
  }

  metadata = {
    ssh-keys = "debian:${file("~/.ssh/id_rsa.pub")}"
  }

  labels = {
    role = "zabbix-server"
  }
}