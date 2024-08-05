resource "aws_iam_group" "groups" {
  for_each = var.groups
  name     = each.key
  path     = "/"
}
