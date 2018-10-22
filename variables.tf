variable "name" {
  description = "Name to be used on all resources as prefix"
}

variable "instance_count" {
  description = "Number of instances to launch"
  default     = 1
}

variable "ami" {
  description = "ID of AMI to use for the instance"
}

variable "placement_group" {
  description = "The Placement Group to start the instance in"
  default     = ""
}

variable "tenancy" {
  description = "The tenancy of the instance (if the instance is running in a VPC). Available values: default, dedicated, host."
  default     = "default"
}

variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized"
  default     = false
}

variable "disable_api_termination" {
  description = "If true, enables EC2 Instance Termination Protection"
  default     = false
}

variable "instance_initiated_shutdown_behavior" {
  description = "Shutdown behavior for the instance" # https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/terminating-instances.html#Using_ChangingInstanceInitiatedShutdownBehavior
  default     = ""
}

variable "instance_type" {
  description = "The type of instance to start"
}

variable "key_name" {
  description = "The key name to use for the instance"
  default     = ""
}

variable "monitoring" {
  description = "If true, the launched EC2 instance will have detailed monitoring enabled"
  default     = false
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = "list"
}

variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  type        = "list"
}

variable "associate_public_ip_address" {
  description = "If true, the EC2 instance will have associated public IP address"
  default     = false
}

variable "private_ip" {
  description = "Private IP address to associate with the instance in a VPC"
  default     = ""
}

variable "source_dest_check" {
  description = "Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs."
  default     = true
}

variable "user_data" {
  description = "The user data to provide when launching the instance"
  default     = ""
}

variable "iam_instance_profile" {
  description = "The IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile."
  default     = ""
}

variable "ipv6_address_count" {
  description = "A number of IPv6 addresses to associate with the primary network interface. Amazon EC2 chooses the IPv6 addresses from the range of your subnet."
  default     = 0
}

variable "ipv6_addresses" {
  description = "Specify one or more IPv6 addresses from the range of the subnet to associate with the primary network interface"
  default     = []
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  default     = {}
}

variable "volume_tags" {
  description = "A mapping of tags to assign to the devices created by the instance at launch time"
  default     = {}
}

variable "root_block_device" {
  description = "Customize details about the root block device of the instance. See Block Devices below for details"
  default     = []
}

variable "ebs_block_device" {
  description = "Additional EBS block devices to attach to the instance"
  default     = []
}

variable "ephemeral_block_device" {
  description = "Customize Ephemeral (also known as Instance Store) volumes on the instance"
  default     = []
}

variable "network_interface" {
  description = "Customize network interfaces to be attached at instance boot time"
  default     = []
}

variable "cpu_credits" {
  description = "The credit option for CPU usage (unlimited or standard)"
  default     = "standard"
}

variable "chef_role" {
  description = "The top level role to assign to the instance"
  default     = ""
}

variable "chef_environment" {
  description = "The Chef environment to put the instance in"
  default     = "_default"
}

variable "chef_organization" {
  type        = "string"
  description = "The organization the instance will be bootstrapped against"
  default     = ""
}

variable "chef_user" {
  type        = "string"
  description = "The Chef user/client that will be used to bootstrap the node"
  default     = ""
}

variable "chef_client_version" {
  type        = "string"
  description = "the version of Chef to install on the node"
  default     = ""
}

variable "chef_vault_json" {
  description = "The json string to pass to chef-client's --bootstrap-vault-json flag"
  default     = ""
}

variable "ssh_private_key" {
  type        = "string"
  description = "The private key used to ssh into the instance. Please use an S3 bucket!"
  default     = ""
}

variable "chef_secret_key" {
  type        = "string"
  description = "The encrypted data_bag secret to use with Chef"
  default     = ""
}

variable "chef_user_key" {
  type        = "string"
  description = "The private key associated to the Chef user used to bootstrap"
  default     = ""
}

variable "chef_server_url" {
  type        = "string"
  description = "The url of your chef server"
  default     = ""
}

variable "default_system_user" {
  type        = "string"
  description = "The system user to use when connecting to the instance"
  default     = ""
}

variable "bastion_host" {
  type        = "string"
  description = "The hostname/addresse of the bastion instance to go through when SSHing"
  default     = ""
}

variable "bastion_user" {
  type        = "string"
  description = "The system user to use when connecting to the bastion instance"
  default     = ""
}

variable "bastion_private_key" {
  type        = "string"
  description = "The private key associated to the bastion user"
  default     = ""
}
