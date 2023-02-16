
resource "aws_instance" "dev_machine" {
  ami = "ami-0dfcb1ef8550277af"
  instance_type = "t2.micro"
  key_name = "keypair"
  tags = {
    Environment = "dev"
    Name = "${var.name}-server"
  }
}
