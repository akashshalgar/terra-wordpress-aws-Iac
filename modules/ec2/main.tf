resource "aws_instance" "wordpress" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.vpc_security_group_ids
  key_name                    = var.key_name
  associate_public_ip_address = true

  user_data = templatefile("${path.module}/../../scripts/user-data-ec2-instance.sh", {
    RDS_DB_HOST     = var.db_host,
    RDS_DB_NAME     = var.db_name,
    RDS_DB_USERNAME = var.db_user,
    RDS_DB_PASSWORD = var.db_pass
  })
}

