resource "aws_db_instance" "postgress" {
  identifier             = "education"
  instance_class         = "db.t3.micro"
  allocated_storage      = 50
  engine                 = "postgres"
  engine_version         = "14.1"
  username               = 
  password               = 
  db_subnet_group_name   = var.subenet_B_networking
  vpc_security_group_ids = var.security_networking.id
  parameter_group_name   = aws_db_subnet_group.networkinsdb.id
  publicly_accessible    = true
  skip_final_snapshot    = true
}