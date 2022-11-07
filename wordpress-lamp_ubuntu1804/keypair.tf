resource "aws_key_pair" "wordpress" {
  key_name   = "wordpress"
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "wordpress" {
    content  = tls_private_key.rsa.private_key_pem
    filename = "wordpress"
    file_permission = 0400
}