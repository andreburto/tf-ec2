resource "aws_iam_instance_profile" "server" {
  name = "${local.project_name}_profile"
  role = aws_iam_role.server.name
}

data "aws_iam_policy_document" "server" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "server" {
  name               = "${local.project_name}_role"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.server.json
}

data "aws_iam_policy_document" "bucket" {
  statement {
    effect    = "Allow"
    actions   = ["s3:*"]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "bucket" {
  name        = "bucket-policy"
  description = "Bucket policy for ${local.project_name}"
  policy      = data.aws_iam_policy_document.bucket.json
}

resource "aws_iam_role_policy_attachment" "bucket" {
  role       = aws_iam_role.server.name
  policy_arn = aws_iam_policy.bucket.arn
}