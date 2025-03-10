locals {
  create             = var.create && var.putin_khuylo
  is_t_instance_type = replace(var.instance_type, "/^t(2|3|3a|4g){1}\\..*$/", "1") == "1" ? true : false
  ami                = try(coalesce(var.ami, try(data.aws_ami.selected[0].id, null), try(nonsensitive(data.aws_ssm_parameter.this[0].value), null)), null)
  name               = "${var.org}_${var.application}_${local.os_abv}_${var.instance_number}${local.env_abv}"
  windows_instance   = var.ami != null && var.ami_os == "override" ? (data.aws_ami.this[0].platform != "" ? "WIN" : "LX") : "ovr"
  env_abv = lookup(
    {
      dev  = "D",
      qa   = "Q",
      stg  = "S",
      uat  = "U",
      prod = "P"
    },
    var.environment,
    var.environment
  )
  os_abv = lookup(
    {
      Windows      = "WIN",
      Amazon_Linux = "AL",
      RHEL         = "RHEL",
      Ubuntu       = "UB",
      override     = local.windows_instance
    },
    var.ami_os,
    var.ami_os
  )
  os_search = lookup(
    {
      Windows      = "Windows_Server-2025-English-Full-Base-*"
      Amazon_Linux = "amzn2-ami-kernel-5.10-hvm-*",
      RHEL         = "RHEL-9.5.0_HVM-*",
      Ubuntu       = "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*",
      override     = ""
    },
    var.ami_os
  )
}

