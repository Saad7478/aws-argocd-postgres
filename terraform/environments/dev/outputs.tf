output "kube_public_ip" {
  value = module.compute.kube_public_ip
}

output "kube_instance_id" {
  value = module.compute.kube_instance_id
}

/*
output "storage_volume_id" {
  value = module.storage.volume_id
}
*/
