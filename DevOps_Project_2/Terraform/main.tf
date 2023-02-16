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

data "aws_vpc" "awsb39vpc" {

    id = "vpc-0a4aa6bf43a190a1a"
} 

data "aws_subnets" "awsb39vpcsubnets" {
    filter {
        name = "vpc-id"
        values = ["vpc-0a4aa6bf43a190a1a"]

    }
}
resource "aws_instance" "dev_machine" {
  ami = data.aws_ami.amazon-linux.id
  subnet_id = data.aws_subnet.awsb39vpcsubnets.0.id
  instance_type = "t2.micro"
  key_name = "keypair"

  tags = {
    Environment = "dev"
    Name = "${var.name}-server"
  }
}
