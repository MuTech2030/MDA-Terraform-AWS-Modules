resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  iam_instance_profile = var.iam_instance_profile_name
  user_data = var.user_data

  tags = var.tags
}
