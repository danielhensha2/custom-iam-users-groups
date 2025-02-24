resource "aws_iam_user" "users" {
  for_each = toset(var.user_names)
  name     = each.key
}

resource "aws_iam_group" "group" {
  name = var.group_name
}

resource "aws_iam_group_membership" "membership" {
  name  = "${var.group_name}-membership" # Unique name for the membership resource
  group = aws_iam_group.group.name
  users = [for user_name in var.user_names : aws_iam_user.users[user_name].name]
}

# Create a custom IAM policy
resource "aws_iam_policy" "custom_s3_read_only" {
  name        = "CustomS3ReadOnlyAccess"
  description = "A custom policy for S3 read-only access"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:Get*",
          "s3:List*"
        ]
        Resource = "*"
      }
    ]
  })
}

# Attach the custom policy to the IAM group

resource "aws_iam_group_policy_attachment" "policy_attachment" {
  group      = aws_iam_group.group.name
  policy_arn = aws_iam_policy.custom_s3_read_only.arn
}