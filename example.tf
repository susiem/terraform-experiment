provider "aws" {
  region = "${var.region}"
}

resource "aws_instance" "example" {
  ami           = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}"
}

output "ip" {
  value = "${aws_eip.ip.public_ip}"
}

terraform {
  backend "consul" {
    address = "demo.consul.io"
    path    = "getting-started-dfgdfgretw490oq3"
    lock    = false
  }
}
