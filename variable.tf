variable "instance_user" {
  default = "ec2-user"
}

variable "private_ssh_key" {
  default = "hello-key"
}

variable "public_ssh_key" {
  default = "hello-key.pub"
}

variable "instance_size" {
  default = "t2.small"
}
