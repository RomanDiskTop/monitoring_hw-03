output "zabbix_server_public_ip" {
  description = "Публичный IP Zabbix-сервера"
  value       = yandex_compute_instance.srv_zbx1.network_interface[0].nat_ip_address
}

output "zabbix_server_internal_ip" {
  description = "Внутренний IP Zabbix-сервера"
  value       = yandex_compute_instance.srv_zbx1.network_interface[0].ip_address
}

output "ws_internal_ips" {
  description = "Внутренние IP-адреса агентов (пока только: ws-01)"
  value = [
    yandex_compute_instance.ws1.network_interface[0].ip_address,
    yandex_compute_instance.kotenkovra1.network_interface[0].ip_address,
    yandex_compute_instance.kotenkovra2.network_interface[0].ip_address,
  ]
}

output "ssh_to_zabbix_server" {
  description = "Для подключения к Zabbix-серверу"
  value       = "ssh debian@${yandex_compute_instance.srv_zbx1.network_interface[0].nat_ip_address}"
}

output "ssh_to_ws1" {
  description = "SSH через бастион на агент ws1"
  value       = "ssh -J debian@${yandex_compute_instance.srv_zbx1.network_interface[0].nat_ip_address} debian@${yandex_compute_instance.ws1.network_interface[0].ip_address}"
}