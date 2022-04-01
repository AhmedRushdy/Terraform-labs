resource "aws_instance" "web" {
ami = var.ami
instance_type = var.ec2_type
key_name = aws_key_pair.deployer.key_name
vpc_security_group_ids=[ aws_security_group.allow_tls.id ]
tags = {
Name = var.tags
}
}
resource "aws_key_pair" "deployer" {
 key_name   = "deploy-key"
 public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7e4t8VOsLDarlqWyU1NQ7lrQBrwi0l3DsVUqf73n7y7C4LLO1EUK7PYsLgZesxLHPSBooTkCJzZx/oL7rGfeXAsRsMuK7TbPbYuv7CONJ1vtq7JNF94S5YXoI4MXRJOPCZF8ct1gPm3ewdCb0eoPZ7zOiEE6VlEJU2vDPkV+pQie6GgjufYW9znpqSZVTk0TPccDn+MmipGlc3wHRTBrpXJwGzvXFJpB32C0ZQxJtXAgx7+WYwp3kLP/ttn3P8ugsMB4dr7rzl6HrhuPo2ZpJt/LsI8Zll2cKVvZrmu9kZjKcsFaBWSH6Rjidyfu6s/yLjdsM9XhGnzB2VjXqcQKB ahmed@DESKTOP-1DBE87B"
}
resource "aws_security_group" "allow_tls" {
  name        = var.key-name
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-02f843ff8f4d4278c"

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
