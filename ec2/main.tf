#https://learn.hashicorp.com/tutorials/terraform/aws-build?in=terraform/aws-get-started
terraform {
  cloud {
    organization = "gabrielstar"
    workspaces {
      name = "one"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "eu-central-1"
}

resource "aws_instance" "gabriel_server" {
  ami           = "ami-09042b2f6d07d164a" #amzon machine image
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
    User = "gs"
  }
}

# to view - https://eu-central-1.console.aws.amazon.com/resource-groups/tag-editor/find-resources?region=eu-central-1#query=regions:!%28%27AWS::AllSupported%27%29,resourceTypes:!%28%27AWS::AllSupported%27%29,tagFilters:!%28%29,type:TAG_EDITOR_1_0