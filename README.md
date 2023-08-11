# Requirements
Make sure that you have the following installed and signed up for:
1. Terraform
2. AWS Cloud Account

## Navigate to the Terraform Folder inside Stage-Two Directory
 `cd stage-two/Terraform`

## Run the following command to initialize Terraform 
 `Terraform init`

## Run the following command to validate the script
 `Terraform validate`

 ## Run the following command to plan the deployment of the instances to AWS Cloud
 `Terraform plan`

## Run the folllowing to start the Terraform infrastructure instrumentation and invoke the Ansible Playbook
 `Terraform apply`

### wait for the instances to finish being created automatically by Terraform, and Ansible to install the Docker packages, pull the images and start the containers on the created instances.
