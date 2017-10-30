variable "name" {
  description = "Name to be used on all resources as prefix"
}

variable "count" {
  description = "Number of instances to launch"
  default     = 1
}

variable "ami" {
  description = "ID of AMI to use for the instance"
}

variable "availability_zone" {
  description = "The AZ to start the instance in"
  default     = ""
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
  default     = ""
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

variable "spot_price" {
  type        = "string"
  description = "The maximum hourly price (bid) you are willing to pay for the instance, e.g. 0.10"
}

variable "wait_for_fulfillment" {
  description = "(Optional; Default: false) If set, Terraform will wait for the Spot Request to be fulfilled, and will throw an error if the timeout of 10m is reached."
  default     = false
}

variable "launch_group" {
  type        = "string"
  description = "Group name to assign the instances to so they can be started/stopped in unison, e.g. purple-plutonium"
  default     = ""
}

variable "instance_interruption_behaviour" {
  type        = "string"
  description = "Whether a Spot instance stops or terminates when it is interrupted, can be stop or terminate"
  default     = "terminate"
}

variable "block_duration_minutes" {
  type        = "string"
  description = "(Optional) The required duration for the Spot instances, in minutes. This value must be a multiple of 60 (60, 120, 180, 240, 300, or 360)."
  default     = "0"
}

variable "spot_type" {
  type        = "string"
  description = "(Optional; Default: 'persistent') If set to 'one-time', after the instance is terminated, the spot request will be closed. Also, Terraform can't manage one-time spot requests, just launch them."
  default     = "persistent"
}

variable "create_timeout" {
  description = "(Defaults to 10 mins) Used when requesting the spot instance (only valid if wait_for_fulfillment = true)"
  default     = "10m"
}

variable "delete_timeout" {
  description = "(Defaults to 10 mins) Used when terminating all instances launched via the given spot instance request"
  default     = "10m"
}
