resource "aws_iam_policy_attachment" "policy_attachments" {
  for_each = var.policy_mapping
  name     = each.key
  groups   = [each.key]
  policy_arn = each.value
   
}
