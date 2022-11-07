resource "aws_instance" "wordpress" {
  ami                    = data.aws_ami.ubuntu_latest.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.wp-subnet.id
  vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]
  key_name = aws_key_pair.wordpress.key_name


provisioner "local-exec" {
    command = "sleep 60; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu --private-key /home/il4real/ansible/ansible-playbooks/wordpress-lamp_ubuntu1804/wordpress -i '${aws_instance.wordpress.public_ip},' ./playbook.yml"
  }
}