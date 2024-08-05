resource "aws_iam_group_membership" "group_memberships" {
  for_each = var.group_memberships
  name     = each.key
  users    = each.value
  group    = each.key
  
}
