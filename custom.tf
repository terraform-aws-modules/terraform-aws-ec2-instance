variable "alarm_info_sns_topic_arn" {
  type = string
  description = "The ARN of the SNS topic to notify when on info alerts"
}

variable "alarm_sns_topic_arn" {
  type = string
  description = "The ARN of the SNS topic to notify when on critical alerts"
}

variable "environment" {
  type = string
  description = "The environment tag to apply to all resources. eg: production, testing, staging, etc"

  validation {
    condition     = var.environment == null || can(regex("^(production|testing|staging|development)$", var.environment))
    error_message = "environment must be lowercase alphanumeric with hyphens only."
  }
}

variable "service" {
  type = string
  description = "Service hosted on this instance. eg: squadstack, metabase, grafana, etc"

  validation {
    condition     = var.service == null || can(regex("^[a-z-]+$", var.service))
    error_message = "service_component must be lowercase alphabets with hyphens only."
  }
}

variable "service_component" {
  type = string
  default = null
  description = "[optional] Service Group within a service. eg: app, api, celery, etc"

  validation {
    condition     = var.service_component == null || can(regex("^[a-z0-9-]+$", var.service_component))
    error_message = "If provided, service_component must be lowercase alphanumeric with hyphens only."
  }
}

variable "owner_team" {
  type = string
  description = "Owner of this ec2. eg: platform, supply, demand, ds, etc"

  validation {
    condition     = var.owner_team == null || can(regex("^(platform|supply|demand|integrations|data-science)$", var.owner_team))
    error_message = "owner_team must be amongst platform, supply, demand, integrations, data-science."
  }
}

resource "aws_cloudwatch_metric_alarm" "ec2_cpuutilization_alert_info" {
  alarm_name          = "${var.name}_high_cpu_alert"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "5"
  datapoints_to_alarm = "4"
  treat_missing_data  = "missing"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "85"
  alarm_description   = "This metric monitors ec2 CPU Utilization"
  alarm_actions       = [var.alarm_info_sns_topic_arn]
  unit                = "Percent"
  dimensions = {
    InstanceId = try(
      aws_instance.this[0].id,
      aws_instance.ignore_ami[0].id,
    )
  }
}



resource "aws_cloudwatch_metric_alarm" "ec2_cpuutilization_alert_warning" {
  alarm_name          = "${var.name}_critical_cpu_alert"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "15"
  datapoints_to_alarm = "12"
  treat_missing_data  = "breaching"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Maximum"
  threshold           = "95"
  alarm_description   = "This metric monitors ec2 CPU Utilization"
  alarm_actions = [var.alarm_sns_topic_arn]
  unit                = "Percent"
  dimensions = {
    InstanceId = try(
      aws_instance.this[0].id,
      aws_instance.ignore_ami[0].id,
    )
  }
}
