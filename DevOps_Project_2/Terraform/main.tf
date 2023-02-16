data "aws_ami" "amazon-linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
data "aws_subnet" "public" {
    id = "subnet-02ba5fc534b945de3"
}
resource "aws_instance" "dev_machine" {
  ami = data.aws_ami.amazon-linux.id
  subnet_id = data.aws_subnet.public
  instance_type = "t2.micro"
  key_name = "keypair"

  tags = {
    Environment = "dev"
    Name = "${var.name}-server"
  }
}
