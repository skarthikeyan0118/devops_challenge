#Adding files and components for deploying docker container in to the AWS Linux VM instances and testing it.

Steps to create the infrastructure:


**install packer in your local ubuntu system.**

$ export VER="1.4.1" 
$ wget https://releases.hashicorp.com/packer/${VER}/packer_${VER}_linux_amd64.zip 
$ Unzip packer_${VER}_linux_amd64.zip 
$ sudo mv packer /usr/local/bin

Once packer is installed , create the packer file packer.json (contents of the packer.json are in the repository)

**components that are created using packer.**

1. AMI
2. The created AMI is to have a customised tools installed in the VM that you want to run, Here Jenkins and Docker are installed.

The installations of the Jenkins and Docker are refferred from the install-docker.sh file where you can see the packages are installed via shell scripts

A new AMI with (Docker and jenkins installed is created)

**BUILD INFRASTRUCTURE using TERRAFORM:**

Terraform resources and modules are created. AWS Credentials are stored in as PROFILE. An AWS Profile is created and the credentials are handled over there. So that the sensitive informations are handled in this way.

while creating terraform , the aws resources and type are called in the code. The AMI that is created using packer is used in the terraform infrastructure creation. 
AWS resources are stored in as variables for the easy code handling.

Now, AWS VM instance is ready running with docker and jenkins installed in it.

**Create Docker file:**

The Docker file contains app index.html and copies it to nginx container. 

nginx container is deployed in to VM instances using jenkins file.

When the jenkins file built on the pipeline, it deploys the nginx container and index.html 

**CI/CD**

To run the jenkins file , here jenkins pipeline is installed and using BlueOcean(from jenkins) we can deploy the docker file and jenkins file.

Everytime the code the changed in the github, the pipeline can be triggered and the new changes are rolled out.

A small snipet of the output in blueocean of the pipeline



