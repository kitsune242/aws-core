output "landing_bucket_id" {
  value = module.landing_zone.bucket_id
}

output "landing_notification_topic_arn" {
  value = module.landing_data_notification.topic_arn
}

output "raw_bucket_id" {
  value = module.raw_zone.bucket_id
}

output "raw_notification_topic_arn" {
  value = module.raw_data_notification.topic_arn
}

output "curated_bucket_id" {
  value = module.curated_zone.bucket_id
}

output "consumption_bucket_id" {
  value = module.consumption_zone.bucket_id
}
