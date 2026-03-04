variable "region" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "vpc_tag" {
  type = string
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "private_subnet_cidrs" {
  type = list(string)
}

variable "pubsub_name" {
  type = string
}

variable "privsub_name" {
  type = string
}

variable "igw_name" {
  type = string
}
