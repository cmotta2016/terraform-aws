resource "aws_vpc" "hello-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "hello-devops"
  }
}

resource "aws_subnet" "public-sb" {
  vpc_id     = "${aws_vpc.hello-vpc.id}"
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "hello-devops"
  }
}

resource "aws_internet_gateway" "gw-devops" {
  vpc_id = "${aws_vpc.hello-vpc.id}"

  tags = {
    Name = "hello-devops"
  }
}

resource "aws_route_table" "devops-table" {
  vpc_id = "${aws_vpc.hello-vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw-devops.id}"
  }

  tags = {
    Name = "hello-devops"
  }
}

resource "aws_route_table_association" "sb-association" {
  subnet_id      = "${aws_subnet.public-sb.id}"
  route_table_id = "${aws_route_table.devops-table.id}"
}

resource "aws_security_group" "allow_ports" {
  name        = "allow_ports"
  description = "Allow RabbitMQ and Applications Ports"
  vpc_id      = "${aws_vpc.hello-vpc.id}"
  
  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 15672
    to_port     = 15672
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ports"
  }
}

