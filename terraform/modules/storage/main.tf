resource "aws_ebs_volume" "postgres_data" {
   
  availability_zone = var.public_azs[0]

  size = var.volume_size
  type = var.volume_type

  tags = merge(var.tags, {
    Name = "${var.name}-kube-postgres"
  })

}

resource "aws_volume_attachment" "postgres_attach" {
  device_name = var.device_name

  volume_id   = aws_ebs_volume.postgres_data.id
  
  instance_id = var.instance_id

  force_detach = true
}