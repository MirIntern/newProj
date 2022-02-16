
resource "aws_vpc" "myVPC" {
	cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "ansible" {
	vpc_id = aws_vpc.myVPC.id	
	cidr_block = "10.0.0.0/24"
	availability_zone = "us-east-1a"
}

resource "aws_subnet" "jenkins" {
	vpc_id = aws_vpc.myVPC.id
	cidr_block = "10.0.2.0/24"
	availability_zone = "us-east-1c"
}

resource "aws_subnet" "minikube" {
	vpc_id = aws_vpc.myVPC.id	
	cidr_block = "10.0.3.0/24"
	availability_zone = "us-east-1b"
}

resource "aws_internet_gateway" "igwFrontEnd" {
	vpc_id = aws_vpc.myVPC.id
}
