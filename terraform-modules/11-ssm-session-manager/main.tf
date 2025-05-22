resource "aws_iam_role" "ssm_instance_role" {
  name = var.instance_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ssm_core" {
  role       = aws_iam_role.ssm_instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "ssm_profile" {
  name = "${var.instance_role_name}-profile"
  role = aws_iam_role.ssm_instance_role.name
}

resource "aws_ssm_document" "ssm_session_settings" {
  name          = "SSM-SessionManagerRunShell"
  document_type = "Session"
  content = jsonencode({
    schemaVersion = "1.0"
    description   = "SSM Session Manager Run Shell"
    sessionType   = "Standard_Stream"
    inputs = {
      shellProfile = {
        linux = "sudo su -"
      }
    }
  })
}
