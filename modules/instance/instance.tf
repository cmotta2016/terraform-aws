data  "aws_ami" "amazon-linux-2" {
 most_recent = true

 filter {
   name   = "owner-alias"
   values = ["amazon"]
 }


 filter {
   name   = "name"
   values = ["amzn2-ami-hvm*"]
 }
 owners = ["amazon"]
}

resource "aws_instance" "hello-instance" {
// depends_on = ["aws_internet_gateway.gw-devops", "aws_key_pair.hello-key"]

 ami                         = "${data.aws_ami.amazon-linux-2.id}"
 associate_public_ip_address = true
 instance_type               = "t2.micro"
 key_name                    = "${var.private_ssh_key}"
 vpc_security_group_ids      = ["${var.security_group_id}"]
// vpc_security_group_ids      = ["${aws_security_group.allow_ports.id}"]
 subnet_id                   = "${var.subnet_name}"
// subnet_id                   = "${aws_subnet.public-sb.id}"
}
