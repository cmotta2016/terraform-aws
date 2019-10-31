output "subnet_name" {
 value = "${aws_subnet.public-sb.id}"
}


output "security_group_id" {
 value = "${aws_security_group.allow_ports.id}"
}
