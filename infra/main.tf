module "landing_data_notification" {
  source     = "git::https://github.com/roche-oli/oli-poc-common.git//infra/modules/sns_topic?ref=v1.0.0"
  topic_name = "${var.project_name}-landing-notification-${var.region}-${var.environment}"
  tags = {
    Environment = var.environment
  }
}

module "landing_zone" {
  source                     = "git::https://github.com/roche-oli/oli-poc-common.git//infra/modules/s3_bucket?ref=v1.0.0"
  bucket_name                = "${var.project_name}-landing-${var.region}-${var.environment}"
  sns_notification_topic_arn = module.landing_data_notification.topic_arn
  tags = {
    Zone        = "Landing"
    Environment = var.environment
  }
}

module "raw_data_notification" {
  source     = "git::https://github.com/roche-oli/oli-poc-common.git//infra/modules/sns_topic?ref=v1.0.0"
  topic_name = "${var.project_name}-raw-notification-${var.region}-${var.environment}"
  tags = {
    Environment = var.environment
  }
}

module "raw_zone" {
  source                     = "git::https://github.com/roche-oli/oli-poc-common.git//infra/modules/s3_bucket?ref=v1.0.0"
  bucket_name                = "${var.project_name}-raw-${var.region}-${var.environment}"
  sns_notification_topic_arn = module.raw_data_notification.topic_arn
  tags = {
    Zone        = "Raw"
    Environment = var.environment
  }
}

module "curated_zone" {
  source      = "git::https://github.com/roche-oli/oli-poc-common.git//infra/modules/s3_bucket?ref=v1.0.0"
  bucket_name = "${var.project_name}-curated-${var.region}-${var.environment}"
  tags = {
    Zone        = "Curated"
    Environment = var.environment
  }
}

module "consumption_zone" {
  source      = "git::https://github.com/roche-oli/oli-poc-common.git//infra/modules/s3_bucket?ref=v1.0.0"
  bucket_name = "${var.project_name}-consumption-${var.region}-${var.environment}"
  tags = {
    Zone        = "Consumption"
    Environment = var.environment
  }
}
