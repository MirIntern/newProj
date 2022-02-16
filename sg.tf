resource "aws_security_group" "allowPort80Ingress" {  

	vpc_id = aws_vpc.myVPC.id

	ingress {
	 from_port = 80
	 to_port = 80
	 protocol = "tcp"
	 cidr_blocks = ["0.0.0.0/0"]
	}

}

resource "aws_security_group" "allowPort8080Ingress" {

	vpc_id = aws_vpc.myVPC.id

	ingress {
	 from_port = 8080
	 to_port = 8080
	 protocol = "tcp"
	 cidr_blocks = ["0.0.0.0/0"]
	}

}

resource "aws_security_group" "allowAllIngress" {

	vpc_id = aws_vpc.myVPC.id

	ingress {
	 from_port = 0
	 to_port = 0
	 protocol = -1
	 cidr_blocks = ["0.0.0.0/0"]
	}
}

resource "aws_security_group" "allowAllEgress" {

	vpc_id = aws_vpc.myVPC.id

	egress {
	 from_port = 0
	 to_port = 0
	 protocol = -1
	 cidr_blocks = ["0.0.0.0/0"]
	}
}

resource "aws_security_group" "minikube" {

	vpc_id = aws_vpc.myVPC.id

}

resource "aws_security_group" "ansibleServer" {

	vpc_id = aws_vpc.myVPC.id

}


resource "aws_security_group" "jenkins" {

	vpc_id = aws_vpc.myVPC.id

}

resource "aws_security_group" "sshAccess" {

	vpc_id = aws_vpc.myVPC.id

	ingress {
	 from_port = 22
	 to_port = 22
	 protocol = "tcp"
	 cidr_blocks = ["0.0.0.0/0"]
	}
}