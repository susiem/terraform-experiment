provider "aws" {
  region = "${var.region}"
}

module "consul" {
  source = "hashicorp/consul/aws"

  aws_region  = "${var.region}" # should match provider region
  num_servers = "3"
}

output "consul_server_asg_name" {
  value = "${module.consul.asg_name_servers}"
}
