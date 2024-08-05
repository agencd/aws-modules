output "policy_attachments" {
  value = [for attachment in aws_iam_policy_attachment.policy_attachments : attachment.id]
}
