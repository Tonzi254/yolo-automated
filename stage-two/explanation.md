OBJECTIVES

# 1.Base Image

I selected node13.12.0-alpine as my base image as it lightweight and security-oriented and the frontend has a react application with a dependency on this particular node version

# 2.Dockerfile Directives
Define base image
FROM node:alpine

Define working directory for the client application
WORKDIR /app/client

Copy package and package-lock.json to the working directory
COPY ./client/package*.json ./


copy rest of the app to the working directory
COPY ./client .

Install dependencies 
RUN npm install

Define entry point
CMD [ "npm", "start" ]

Define working directory for the backend application
WORKDIR /app/backend

Copy package and package-lock.json to the working directory
COPY ./backend/package*.json ./

Copy rest of the backend to the working directory
./backend .

Install dependencies 
RUN npm install

Define entry point
CMD [ "npm", "start" ]

# 3.Docker-Compose Networking 
The backend application was allocated port 5000, while the fronted application was allocated port 3000.
Both applications use a common network called yolo-network that was defined under the docker bridge

# 4.Docker-Compose Volume Definition
mongo_db was the volume used to persist the db data once its shut down.

# 5.Git Workflow
git add . (to stage the changes)
git commit -m '<message>' (to commit the changes and labelling with the appropriate messages)
git push origin master (to push to my forked app repo)

# 6.Ansible Playbook Roles
1. app-dir role - The purpose of this role is to create the desired directory structure for the application
2. frontend role - The purpose of this role is to pull the yolo client image from docker and build it
3. backend role - The purpose of this role is to pull the yolo backend image from docker and build it
4. docker role - The purpose of this role is to install the required Debian packages for Docker,Install Docker Engine, Install Docker-Compose and finally to start the Docker Service
5. docker-compose role - The purpose of this role is to copy the docker-compose file to the app directory and to run the containers

# 7.Terraform and Ansible Instrumentation
The function of Terraform is to perform instrumentation of the infrastructure on AWS Cloud by automating the creating of EC2 instances and the invoking the Ansible Playbook which 
1. Installs the required Debian packages
2. Installs Ansible
3. Installs Docker Engine and Docker-Compose
4. Pulls Frontend and Backed images from Docker Hub and builds them
5. Copies the Docker-Compose file to the app directory
6. Runs the application

# 8.Good practices

1. Image Tagging - I tagged my docker images according to semver conventions
- backend image = tonzi/yolo-backend:1.0.0
- client image = tonzi/yolo-client:1.0.0
- mongo image = mongo:latest

2. Variables
I used variables for referencing the docker images and variables in Terraform for referencing the AWS EC2 instance parameters required for Virtual Machine creation.

3. Use of gitignore and .dockerignore
I used .gitignore and .dockerignore to prevent upload of frontend and backend node_modules and terraform registries which are bulky in size and increase docker image size and image build time. Additionally this also enforced security as the access key and secret key for AWS Cloud was not uploaded to my public Git repository which would have been a major security issue as anyone could use them to create instances on my console and I would incur large and unnecessary resouce utilization bills from AWS

# 9.DockerHub Image Push
The frontend and backend images had been pushed successfully to Docker Hub in a prior IP

# 10.Successful running of the applications and if not, debugging measures applied.
The containers were deployed and run successfully on AWS EC2 instances. Using Terraform I was also able to successfully connect to the AWS EC2 infrastructure to deploy new instances and invoke the Ansible playbook for installing the pre-requisite packages, pulling the docker images for frontend and backend, creating their respective containers and running the containers using docker-compose

