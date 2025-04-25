resource "aws_db_instance" "wordpress" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = var.db_user
  password             = var.db_pass
  db_name              = var.db_name
  db_subnet_group_name = aws_db_subnet_group.db.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  publicly_accessible  = true
  skip_final_snapshot  = true
}


resource "aws_db_subnet_group" "db" {
  name       = "db-subnet-group"
  subnet_ids =  var.private_subnet_ids
}

resource "aws_security_group" "rds_sg" {
  name_prefix = "rds-sg"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = var.allow_from_cidr
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

