variable "region" {
  default = "ap-south-1"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_name" {
  default = "gitlab-key"
}

variable "public_key_path" {
  default = "id_rsa.pub"
}