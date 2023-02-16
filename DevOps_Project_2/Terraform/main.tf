
resource "aws_instance" "dev_machine" {
  ami = "ami-0778521d914d23bc1"
  instance_type = "t2.micro"
  key_name = "keypair"
  tags = {
    Environment = "dev"
    Name = "${var.name}-server"
  }
}
