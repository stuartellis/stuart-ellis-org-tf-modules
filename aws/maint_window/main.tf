terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 3.71.0"
    }
  }

}

resource "aws_iam_policy" "notifiers" {
  name = "notifiers"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sns:Publish",
        ]
        Effect   = "Allow"
        Resource = "${var.sns_alerts_arn}"
      },
    ]
  })
}

resource "aws_iam_role" "notifiers" {
  name = "notifiers"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ssm.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "notifiers" {
  name       = "notifiers"
  role       = aws_iam_role.notifiers.name
  policy_arn = aws_iam_policy.notifiers.arn
}

resource "aws_ssm_maintenance_window" "weekly_linux" {
  name              = "WeeklyLinuxMaint"
  description       = "Weekly Linux maintenance"
  schedule          = "cron(1 0 1 ? * SUN *)"
  schedule_timezone = "etc/UTC"
  duration          = 2
  cutoff            = 0
}

resource "aws_ssm_maintenance_window_target" "ubuntu_standard" {
  window_id     = aws_ssm_maintenance_window.window.id
  name          = "ubuntu-standard"
  description   = "Ubuntu Standard"
  resource_type = "INSTANCE"

  targets {
    key    = "tag:Patch Group"
    values = ["ubuntu-standard"]
  }
}

resource "aws_ssm_patch_baseline" "ubuntu_standard" {
  name        = "ubuntu-standard"
  description = "Standard for Ubuntu"
  approval_rule {
    approve_after_days                   = 7
    enable_non_security                  = true
    approved_patches_compliance_level    = "UNSPECIFIED"
    approved_patches_enable_non_security = true
    operating_system                     = "UBUNTU"
    patch_filter {
      key    = "PRODUCT"
      values = ["Ubuntu20.04"]
    }
    patch_filter {
      key    = "SECTION"
      values = ["All"]
    }
    patch_filter {
      key    = "PRIORITY"
      values = ["Required", "Important", "Standard", "Optional", "Extra"]
    }
  }
}

resource "aws_ssm_patch_group" "patchgroup" {
  baseline_id = aws_ssm_patch_baseline.ubuntu_standard.id
  patch_group = "ubuntu-standard"
}

resource "aws_ssm_maintenance_window_task" "ubuntu_update" {
  description     = "Update standard Ubuntu instances"
  task_type       = "AUTOMATION"
  window_id       = aws_ssm_maintenance_window.weekly_linux.id
  max_concurrency = "100%"
  max_errors      = 7
  priority        = 5
  targets {
    key    = "WindowTargetIds"
    values = [aws_ssm_maintenance_window_target.ubuntu_standard.id]
  }
}

resource "aws_ssm_maintenance_window_task" "ssm_agent_update" {
  description     = "Update SSM Agent"
  task_type       = "RUN_COMMAND"
  window_id       = aws_ssm_maintenance_window.weekly_linux.id
  max_concurrency = "100%"
  max_errors      = 7
  priority        = 1
  task_arn        = "AWS-UpdateSSMAgent"
  targets {
    key    = "WindowTargetIds"
    values = [aws_ssm_maintenance_window_target.ubuntu_standard.id]
  }
  task_invocation_parameters {
    maintenance_window_run_command_parameters {
      comment          = "Update SSM Agent"
      service_role_arn = aws_iam_role.notifiers.arn
      notification_config {
        notification_arn    = var.sns_alerts_arn
        notification_events = ["TimedOut", "Cancelled", "Failed"]
        notification_type   = "Invocation"
      }
    }
  }
}

