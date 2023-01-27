resource "aws_instance" "jks" {
  ami                         = var.amazonlinux2  #ubuntu:20?04
  instance_type               = var.jenks_instance_type  #T2 LARGE
  availability_zone           = var.regions
  subnet_id                   = aws_subnet.subnet_public_1a.id
  associate_public_ip_address = true
  key_name                    = var.key  #CHAVE SSH


  vpc_security_group_ids = [    ## portas 80, 8081, 22
   aws_security_group.sg-networking.id
  ]

  root_block_device {
    delete_on_termination = true
    volume_size           = 50  #SSD
    volume_type           = "gp2"


    tags = {
      Name = var.jenkinsServer
    }
  }

  tags = {
    Name        = "jenkins*Server"
    Environment = "Treinamento"
    OS          = "AMAZONLINUX2"
    Managed     = "IAC"
  }

 user_data = filebase64("Scripts/jenkins.ubuntu.sh")  ##SHELLSCRIPT
}
