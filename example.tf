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

resource "aws_s3_bucket" "bucket" {
  bucket = "tf-example-bucket"

  versioning {
    enabled = true
  }
}

terraform {
  backend "s3" {
    bucket = "tf-example-bucket"
    key    = "tfstate"
    region = "eu-west-2"
  }
}
