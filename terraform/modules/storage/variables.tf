variable "name" {
  type = string
}

variable "instance_id" {
  description = "EC2 instance ID"
  type        = string
}

variable "public_azs" {
  type = list(string)

  validation {
    condition     = length(var.public_azs) >= 1
    error_message = "Au moins 1 AZ sont nécessaires."
  }
}

variable "volume_size" {
  description = "EBS volume size in GB"
  type        = number
  default     = 40
}

variable "volume_type" {
  description = "EBS volume type"
  type        = string
  default     = "gp3"
}

variable "device_name" {
  description = "Device name exposed to EC2"
  type        = string
  default     = "/dev/sdf"
}

variable "tags" {
  description = "Tags for EBS Volume"
  type        = map(string)
  default     = {}
}