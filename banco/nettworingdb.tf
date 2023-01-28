###REDE BANCO DE DADOS
resource "aws_db_subnet_group" "networkinsdb" {
  name       = "group-subenets-publicas"
  subnet_ids = var.subenet_B_networking

  tags = {
    Name        = "REDE-SUBNETS"
    Environment = "ProjetoDevops"
    INFRA       = "SUBENTS_GROUP_ABC"
    Managed     = "IAC"
  }
}