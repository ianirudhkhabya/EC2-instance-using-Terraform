# EC2 instance using terraform

## What is Terraform?
Terraform is an IAC tool, used primarily by DevOps teams to automate various infrastructure tasks. The provisioning of cloud resources, for instance, is one of the main use cases of Terraform. It's a cloud-agnostic, open-source provisioning tool written in the Go language and created by HashiCorp.

## Terraform basic CLI features
```
Usage: terraform [global options] <subcommand> [args]

The available commands for execution are listed below.
The primary workflow commands are given first, followed by
less common or more advanced commands.

Main commands:
  init          Prepare your working directory for other commands
  validate      Check whether the configuration is valid
  plan          Show changes required by the current configuration
  apply         Create or update infrastructure
  destroy       Destroy previously-created infrastructure

All other commands:
  console       Try Terraform expressions at an interactive command prompt
  fmt           Reformat your configuration in the standard style
  force-unlock  Release a stuck lock on the current workspace
  get           Install or upgrade remote Terraform modules
  graph         Generate a Graphviz graph of the steps in an operation
  import        Associate existing infrastructure with a Terraform resource
  login         Obtain and save credentials for a remote host
  logout        Remove locally-stored credentials for a remote host
  output        Show output values from your root module
  providers     Show the providers required for this configuration
  refresh       Update the state to match remote systems
  show          Show the current state or a saved plan
  state         Advanced state management
  taint         Mark a resource instance as not fully functional
  untaint       Remove the 'tainted' state from a resource instance
  version       Show the current Terraform version
  workspace     Workspace management

Global options (use these before the subcommand, if any):
  -chdir=DIR    Switch to a different working directory before executing the
                given subcommand.
  -help         Show this help output, or the help for a specified subcommand.
  -version      An alias for the "version" subcommand.
```
---
## Steps to launch instances using terraform
1. Downlaod terraform from 
https://developer.hashicorp.com/terraform/downloads

1. Create a new folder on home directory and keep that executable(terraform) file on that folder then copy the address of that folder.

1. Search environment variable in search box and edit it by adding a path -> new of the address we copied so that you can access terraform from everywhere.

1. After setting variable, go to command prompt and type `terraform -v`. It is to check the terraform is recognized as an internal and external command or not.

1. Also check for AWS CLI by typing `aws --version`.

1. But before proceeding for creating instance you must be having an IAM user in AWS account and also a key pair.
    - Warning, do check your require version and region etc.

1. Now again create a new folder and open it with code on VSC.

1. Create new file as main.tf and copy the below code.
```
terraform {
  required_version = "~> 1.3.6" # which means >= 1.3 and < 1.4
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Provider Block
provider "aws" {
  region  = "ap-south-1"
  profile = "default"
  #you don't need them if you have already configured your aws account
#   access_key = ""
#   secret_key = ""
}

# Create EC2 Instance
resource "aws_instance" "web" {
  ami           = "ami-074dc0a6f6c764218" # Amazon Linux
  instance_type = "t2.micro"
  count         = 2
  key_name      = "akhabya"
  tags = {
    "Name" = "Anirudh"
  }
}
```
9. Now open terminal in the same window and perform the below command one after the other.
```
1] terraform init
2] terraform plan
3] terraform apply -auto-approve
4] terraform destroy -auto-approve
```
10. Go on to console to see the output.
---

## Still not understand, refer below link 
https://drive.google.com/file/d/1XaG19UPgyeoPPWtNVm4o4EXIUDc6O6Ti/view?usp=share_link

---
## Connect with me
  <a href="https://www.linkedin.com/in/ianirudhkhabya/">
    <img width="30px" src="https://www.vectorlogo.zone/logos/linkedin/linkedin-icon.svg" />
  </a>&ensp;
  <a href="https://twitter.com/ianirudhkhabya">
    <img width="30px" src="https://www.vectorlogo.zone/logos/twitter/twitter-official.svg" />
  </a>&ensp;
  <a href="https://youtube.com/@ianirudhkhabya">
  <img width="30px" src="https://i.pinimg.com/originals/46/02/cb/4602cbc18967da9c1eba7452905cd99b.png" />
  </a>&ensp;
  <a href="https://www.instagram.com/ianirudhkhabya/">
    <img width="30px" src="https://www.vectorlogo.zone/logos/instagram/instagram-icon.svg" />
  </a>&ensp;
