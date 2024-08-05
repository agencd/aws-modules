output "user_names" {
  value = [for user in aws_iam_user.users : user.name]
}
