locals {
  is_t_instance_type = "${replace(var.instance_type, "/^t[23]{1}\\..*$/", "1") == "1" ? "1" : "0"}"
}

######
# Note: network_interface can't be specified together with associate_public_ip_address
######
resource "aws_instance" "this" {
  count = "${var.instance_count * (1 - local.is_t_instance_type)}"

  ami                    = "${var.ami}"
  instance_type          = "${var.instance_type}"
  user_data              = "${var.user_data}"
  subnet_id              = "${element(var.subnet_id, count.index)}"
  key_name               = "${var.key_name}"
  monitoring             = "${var.monitoring}"
  vpc_security_group_ids = ["${var.vpc_security_group_ids}"]
  iam_instance_profile   = "${var.iam_instance_profile}"

  associate_public_ip_address = "${var.associate_public_ip_address}"
  private_ip                  = "${var.private_ip}"
  ipv6_address_count          = "${var.ipv6_address_count}"
  ipv6_addresses              = "${var.ipv6_addresses}"

  # Make sure Chef waits for cloud-init before executing
  # While remote-exec could replace cloud-init here, it cannot be used with autoscaling groups (among others)
  # As such usage of remote-exec should be minimized so we do not end up depending on it
  provisioner "remote-exec" {
    inline = [
      "while true; do",
      "if ! [ -e /var/lib/cloud/instance/boot-finished ]; then",
      "sleep 10",
      "else",
      "exit 0",
      "fi; done",
    ]
    connection {
      type                   = "ssh"
      user                   = "${var.default_system_user}"
      private_key            = "${var.ssh_private_key}"

      # Some nodes require connecting via a Bastion instance
      bastion_host           = "${var.bastion_host}"
      bastion_user           = "${var.bastion_user}"
      bastion_private_key    = "${var.bastion_private_key}"
    }
  }

  provisioner "chef" {
    environment              = "${var.chef_environment}"
    # We're imposing a single role as the run-list as part of our in-house standards
    run_list                 = ["role[${var.chef_role}]"]
    node_name                = "${var.chef_role}-${count.index}"
    secret_key               = "${var.chef_secret_key}"
    server_url               = "${var.chef_server_url}/organizations/${var.chef_organization}"
    fetch_chef_certificates  = true
    recreate_client          = true
    user_name                = "${var.chef_user}"
    user_key                 = "${var.chef_user_key}"
    vault_json               = "${var.chef_vault_json}"
    version                  = "${var.chef_client_version}"
    ssl_verify_mode          = ":verify_peer"
    log_to_file              = true
    disable_reporting        = true

    connection {
      type                   = "ssh"
      user                   = "${var.default_system_user}"
      private_key            = "${var.ssh_private_key}"

      # Some nodes require connecting via a Bastion instance
      bastion_host           = "${var.bastion_host}"
      bastion_user           = "${var.bastion_user}"
      bastion_private_key    = "${var.bastion_private_key}"
    }
  }

  ebs_optimized          = "${var.ebs_optimized}"
  volume_tags            = "${var.volume_tags}"
  root_block_device      = "${var.root_block_device}"
  ebs_block_device       = "${var.ebs_block_device}"
  ephemeral_block_device = "${var.ephemeral_block_device}"

  source_dest_check                    = "${var.source_dest_check}"
  disable_api_termination              = "${var.disable_api_termination}"
  instance_initiated_shutdown_behavior = "${var.instance_initiated_shutdown_behavior}"
  placement_group                      = "${var.placement_group}"
  tenancy                              = "${var.tenancy}"

  tags = "${merge(var.tags, map("Name", var.instance_count > 1 ? format("%s-%d", var.name, count.index+1) : var.name))}"

  lifecycle {
    # Due to several known issues in Terraform AWS provider related to arguments of aws_instance:
    # (eg, https://github.com/terraform-providers/terraform-provider-aws/issues/2036)
    # we have to ignore changes in the following arguments
    ignore_changes = ["private_ip", "root_block_device", "ebs_block_device"]
  }
}

resource "aws_instance" "this_t2" {
  count = "${var.instance_count * local.is_t_instance_type}"

  ami                    = "${var.ami}"
  instance_type          = "${var.instance_type}"
  user_data              = "${var.user_data}"
  subnet_id              = "${element(var.subnet_id, count.index)}"
  key_name               = "${var.key_name}"
  monitoring             = "${var.monitoring}"
  vpc_security_group_ids = ["${var.vpc_security_group_ids}"]
  iam_instance_profile   = "${var.iam_instance_profile}"

  associate_public_ip_address = "${var.associate_public_ip_address}"
  private_ip                  = "${var.private_ip}"
  ipv6_address_count          = "${var.ipv6_address_count}"
  ipv6_addresses              = "${var.ipv6_addresses}"

  # Make sure Chef waits for cloud-init before executing
  # While remote-exec could replace cloud-init here, it cannot be used with autoscaling groups (among others)
  # As such usage of remote-exec should be minimized so we do not end up depending on it

  provisioner "remote-exec" {
    inline = [
      "while true; do",
      "if ! [ -e /var/lib/cloud/instance/boot-finished ]; then",
      "sleep 10",
      "else",
      "exit 0",
      "fi; done",
    ]
    connection {
      type                   = "ssh"
      user                   = "${var.default_system_user}"
      private_key            = "${var.ssh_private_key}"
      timeout                = "10m"
      # Some nodes require connecting via a Bastion instance
      bastion_host           = "${var.bastion_host}"
      bastion_user           = "${var.bastion_user}"
      bastion_private_key    = "${var.bastion_private_key}"
    }
  }

  provisioner "chef" {
    environment              = "${var.chef_environment}"
    # We're imposing a single role as the run-list as part of our in-house standards
    run_list                 = ["role[${var.chef_role}]"]
    node_name                = "${var.chef_role}-${count.index}"
    secret_key               = "${var.chef_secret_key}"
    server_url               = "${var.chef_server_url}/organizations/${var.chef_organization}"
    fetch_chef_certificates  = true
    recreate_client          = true
    user_name                = "${var.chef_user}"
    user_key                 = "${var.chef_user_key}"
    vault_json               = "${var.chef_vault_json}"
    version                  = "${var.chef_client_version}"
    ssl_verify_mode          = ":verify_peer"
    log_to_file              = true
    disable_reporting        = true

    connection {
      type                   = "ssh"
      user                   = "${var.default_system_user}"
      private_key            = "${var.ssh_private_key}"
      timeout                = "10m"
      # Some nodes require connecting via a Bastion instance
      bastion_host           = "${var.bastion_host}"
      bastion_user           = "${var.bastion_user}"
      bastion_private_key    = "${var.bastion_private_key}"
    }
  }

  ebs_optimized          = "${var.ebs_optimized}"
  volume_tags            = "${var.volume_tags}"
  root_block_device      = "${var.root_block_device}"
  ebs_block_device       = "${var.ebs_block_device}"
  ephemeral_block_device = "${var.ephemeral_block_device}"

  source_dest_check                    = "${var.source_dest_check}"
  disable_api_termination              = "${var.disable_api_termination}"
  instance_initiated_shutdown_behavior = "${var.instance_initiated_shutdown_behavior}"
  placement_group                      = "${var.placement_group}"
  tenancy                              = "${var.tenancy}"

  credit_specification {
    cpu_credits = "${var.cpu_credits}"
  }

  tags = "${merge(var.tags, map("Name", var.instance_count > 1 ? format("%s-%d", var.name, count.index+1) : var.name))}"

  lifecycle {
    # Due to several known issues in Terraform AWS provider related to arguments of aws_instance:
    # (eg, https://github.com/terraform-providers/terraform-provider-aws/issues/2036)
    # we have to ignore changes in the following arguments
    ignore_changes = ["private_ip", "root_block_device", "ebs_block_device"]
  }
}
