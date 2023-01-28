###REDE BANCO DE DADOS
resource "aws_db_subnet_group" "networkinsdb" {
  name       = "group-subenets-publicas"
  subnet_ids = [aws_subnet.subnet_public_1b.id,
    aws_subnet.subnet_public_1a.id,aws_subnet.subnet_public_1c.id]

  tags = {
    Name        = "REDE-SUBNETS"
    Environment = "ProjetoDevops"
    INFRA       = "SUBENTS_GROUP_ABC"
    Managed     = "IAC"
  }
}