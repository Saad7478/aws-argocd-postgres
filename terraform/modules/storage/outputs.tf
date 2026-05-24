output "volume_id" {
  value = aws_ebs_volume.postgres_data.id
}

/*
output "volume_arn" {
  value = aws_ebs_volume.postgres_data.arn
}

output "device_name" {
  value = aws_volume_attachment.postgres_attach.device_name
}*/