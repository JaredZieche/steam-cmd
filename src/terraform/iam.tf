# steam s3 access policy for backup bucket
resource "aws_iam_role_policy" "steam_access_policy" {
  name = "steam_s3_policy"
  role = aws_iam_role.steam_cmd_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
          "s3:ListBucket",
          "s3:GetBucketObject",
        ]
        Effect   = "Allow"
        Resource = "arn:aws:s3:::steamcmd*"
      },
    ]
  })
}

resource "aws_iam_role" "steam_cmd_role" {
  name = "steam_cmd_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "${aws_iam_role_policy.steam_access_policy.id}"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

# mfa policy
resource "aws_iam_policy" "enforce_mfa" {
  name = "enforce_mfa"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
            "Sid": "BlockMostAccessUnlessSignedInWithMFA",
            "Effect": "Deny",
            "NotAction": [
                "iam:CreateVirtualMFADevice",
                "iam:DeleteVirtualMFADevice",
                "iam:ListVirtualMFADevices",
                "iam:EnableMFADevice",
                "iam:ResyncMFADevice",
                "iam:ListAccountAliases",
                "iam:ListUsers",
                "iam:ListSSHPublicKeys",
                "iam:ListAccessKeys",
                "iam:ListServiceSpecificCredentials",
                "iam:ListMFADevices",
                "iam:GetAccountSummary",
                "sts:GetSessionToken"
            ],
            "Resource": "*",
            "Condition": {
                "Bool": {
                    "aws:MultiFactorAuthPresent": "false"
                }
            }
      }
  })
}
