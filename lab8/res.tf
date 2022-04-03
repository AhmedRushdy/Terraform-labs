terraform {

  backend "s3" {
    bucket = "rushdy-bucket"
    key    = "myapp/terraform.tfstate"
    region = "us-east-1"
  }


}

resource "aws_instance" "web" {
ami = "ami-0c02fb55956c7d316"
instance_type = "t2.micro"
key_name = aws_key_pair.deployer.key_name
tags = {
Name = "Rushdy"
}
}
resource "aws_key_pair" "deployer" {
 key_name   = "ahmed"
 public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7e4t8VOsLDarlqWyU1NQ7lrQBrwi0l3DsVUqf73n7y7C4LLO1EUK7PYsLgZesxLHPSBooTkCJzZx/oL7rGfeXAsRsMuK7TbPbYuv7CONJ1vtq7JNF94S5YXoI4MXRJOPCZF8ct1gPm3ewdCb0eoPZ7zOiEE6VlEJU2vDPkV+pQie6GgjufYW9znpqSZVTk0TPccDn+MmipGlc3wHRTBrpXJwGzvXFJpB32C0ZQxJtXAgx7+WYwp3kLP/ttn3P8ugsMB4dr7rzl6HrhuPo2ZpJt/LsI8Zll2cKVvZrmu9kZjKcsFaBWSH6Rjidyfu6s/yLjdsM9XhGnzB2VjXqcQKB ahmed@DESKTOP-1DBE87B"
}
resource "aws_s3_bucket" "b" {
  bucket = "rushdy-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }


}



 

