variable "access_key" {
  description = "Access key to AWS console"
}
variable "secret_key" {
  description = "Secret key to AWS console"
}

variable "instance_name" {
  description = "Name of the instance to be created"
  default     = "ansible-client"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami_id" {
  description = "The AMI to use"
  default     = "ami-05ee09b16a3aaa2fd"
}

variable "number_of_instances" {
  description = "number of instances to be created"
  default     = 2
}

variable "subnet_id" {
  description = "The VPC subnet the instance(s) will be created in"
  default     = "subnet-0de3c1b59f1f0b43b"
}
variable "ami_key_pair_name" {
  default = "ansible-servers-key-pair"
}