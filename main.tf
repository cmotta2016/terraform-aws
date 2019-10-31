resource "null_resource" "create_ssh_key" {
  provisioner "local-exec" {
    command = "if [ ! -f ${var.private_ssh_key} ]; then ssh-keygen -t rsa -f ${var.private_ssh_key} -C ${var.instance_user} -N ''; fi"
  }
}

resource "aws_key_pair" "hello-key" {
  key_name   = "hello-key"
  public_key = file(var.public_ssh_key)
  depends_on = [null_resource.create_ssh_key]
}

module "network" {
 source = "./modules/network"
}

module "instance" {
 source = "./modules/instance"
 subnet_name = "${module.network.subnet_name}"
 security_group_id = "${module.network.security_group_id}"
 private_ssh_key = "${var.private_ssh_key}"
}
