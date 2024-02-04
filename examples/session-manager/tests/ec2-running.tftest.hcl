#add command=plan example
run "check_ec2_instance_type" {
  command = plan
  assert {
    error_message = "Instance type should be t2.micro"
    condition     = module.ec2.instance_type == "t3.micro"
  }
}

run "create_ec2_instance" {
  # Check that ec2 instance is created
  assert {
    error_message = "Instance should be running'"
    condition     = module.ec2.instance_state == "running"
  }
}

run "check_ssm_command" {

  module {
    source = "./tests/load"
  }

  variables {
    instance_id = run.create_ec2_instance.ec2_id
    region      = run.create_ec2_instance.region
  }

  assert {
    error_message = "The result should be Success"
    condition     = data.external.aws_ssm_send_command.result["status"] == "\"Success\""
  }

  assert {
    error_message = "The result should be /usr/bin"
    condition     = data.external.aws_ssm_send_command.result["result"] == "\"/usr/bin\\n\""
  }
}
