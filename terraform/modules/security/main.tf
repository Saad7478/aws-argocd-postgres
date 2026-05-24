# KUBERNETES SG
resource "aws_security_group" "kube_sg" {
  name        = "${var.name}-kube-sg"
  description = "Kubernetes security group"
  vpc_id      = var.vpc_id

  ingress {
  description = "Allow ping"
  from_port   = -1
  to_port     = -1
  protocol    = "icmp"
  cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    description = "SSH"

    from_port   = 22
    to_port     = 22
    protocol    = "tcp"

    cidr_blocks = [var.admin_cidr]
  }

  ingress {
    description = "SSH"

    from_port   = 30443
    to_port     = 30443
    protocol    = "tcp"

    cidr_blocks = [var.admin_cidr]
  }

  ingress {
    description = "PostgreSQL"

    from_port = 5432
    to_port   = 5432
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, {
    Name = "${var.name}-kube-sg"
  })
}