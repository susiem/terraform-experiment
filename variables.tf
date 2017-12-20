variable "region" {
  default = "eu-west-2"
}

variable "amis" {
  type = "map"

  default = {
    "eu-west-1" = "ami-ba0329dc"
    "eu-west-2" = "ami-78e8fd1c"
  }
}
