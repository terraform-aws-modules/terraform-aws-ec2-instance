terraform {
  required_providers {
    external = {
      source = "hashicorp/external"
      version = "2.3.2"
    }
  }
}

variable "instance_id" {}
variable "region" {}

data "external" "aws_ssm_send_command" {
    program = ["bash", "./tests/load/ssm_command_test.sh", var.instance_id, var.region]
}

#this is a terraform data source that can run a command
#it is used to run the ssm command to start the session manager session