terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "eu-central-1"
}

# Create an EC2 Instance with Debian 12 AMI = ami-05ee09b16a3aaa2fd
resource "aws_instance" "ec2_instance" {
    instance_type = "${var.instance_type}"
    ami = "${var.ami_id}"
    count = "${var.number_of_instances}"
    subnet_id = "${var.subnet_id}"
    key_name = "${var.ami_key_pair_name}"
}

# Invoke Ansible Playbook to run on the new AWS instances created
  provisioner "local-exec" {
    command = "ansible-playbook -i ${path.module}/ansible-playbook.yaml"
  }