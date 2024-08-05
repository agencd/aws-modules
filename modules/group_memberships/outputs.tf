output "group_memberships" {
  value = [for k, v in var.group_memberships : k]
}

