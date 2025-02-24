output "user_arns" {
  value       = { for user, details in aws_iam_user.users : user => details.arn }
  description = "ARNs of the created IAM users"
}

output "group_arn" {
  value       = aws_iam_group.group.arn
  description = "ARN of the IAM group"
}