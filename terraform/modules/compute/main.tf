# -------------------
# Kubernetes Instance
# -------------------

resource "aws_instance" "kube" {
  
  # You must accept the licence before using this ami
  # ami = "ami-02391db2758465a87"  # Rocky Linux 8
  ami = "ami-0e529d862bbe9899c"    # Rocky Linux 9

  instance_type = var.kube_instance_type
  
  availability_zone = var.public_azs[0]

  key_name = var.key_name

  subnet_id     = var.subnet_id

    vpc_security_group_ids = [
    var.kube_sg_id
  ]

  tags = merge(var.tags, {
    Name = "${var.name}-kube"
  })
}