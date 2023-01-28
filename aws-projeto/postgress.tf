resource "aws_db_instance" "postgress" {
  identifier                = "kubenews"
  instance_class            = "db.t3.medium"
  allocated_storage         = 50
  availability_zone         = "us-east-1b"
  engine                    = "postgres"
  engine_version            = "14.1"
  db_subnet_group_name      = aws_db_subnet_group.networkinsdb.id
  vpc_security_group_ids    = []
  name                      = "kubenews"
  username                  = var.admin
  password                  = var.senha
  skip_final_snapshot       = true
  storage_type              = "gp2"
  port                      = "5432"
  final_snapshot_identifier = "Ignore"
}