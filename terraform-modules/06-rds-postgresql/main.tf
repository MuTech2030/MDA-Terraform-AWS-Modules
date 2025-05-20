

resource "aws_db_subnet_group" "this" {
  name       = "rds-subnet-group"
  subnet_ids = data.aws_subnets.rds_subnets.ids
  tags       = var.tags
}

resource "aws_db_instance" "this" {
  allocated_storage       = var.allocated_storage
  engine                  = "postgres"
  engine_version          = var.engine_version
  instance_class          = var.instance_class
  db_name                 = var.db_name
  username                = var.username
  password                = var.password
  skip_final_snapshot     = var.skip_final_snapshot
  publicly_accessible     = var.publicly_accessible
  db_subnet_group_name    = aws_db_subnet_group.this.name
  vpc_security_group_ids  = var.vpc_security_group_ids
  tags                    = var.tags
}
