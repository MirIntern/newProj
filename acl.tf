resource "aws_network_acl" "ansibleAcl" {

	vpc_id = aws_vpc.myVPC.id
	subnet_ids = [aws_subnet.ansible.id]
	egress {
	 protocol = -1
	 rule_no = 100
	 action = "allow"
	 cidr_block = "0.0.0.0/0"
	 from_port = 0
	 to_port = 0
	}
	ingress {
	 protocol = -1
	 rule_no = 100
	 action = "allow"
	 cidr_block = "0.0.0.0/0"
	 from_port = 0
	 to_port = 0
	}
}

resource "aws_network_acl" "jenkinsServerAcl" {

	vpc_id = aws_vpc.myVPC.id
	subnet_ids = [aws_subnet.jenkins.id]
	egress {
	 protocol = -1
	 rule_no = 100
	 action = "allow"
	 cidr_block = "0.0.0.0/0"
	 from_port = 0
	 to_port = 0
	}
	ingress {
	 protocol = -1
	 rule_no = 100
	 action = "allow"
	 cidr_block = "0.0.0.0/0"
	 from_port = 0
	 to_port = 0
	}
}

resource "aws_network_acl" "minikubeAcl" {

	vpc_id = aws_vpc.myVPC.id
	subnet_ids = [aws_subnet.minikube.id]
	egress {
	 protocol = -1
	 rule_no = 100
	 action = "allow"
	 cidr_block = "0.0.0.0/0"
	 from_port = 0
	 to_port = 0
	}
	ingress {
	 protocol = -1
	 rule_no = 100
	 action = "allow"
	 cidr_block = "0.0.0.0/0"
	 from_port = 0
	 to_port = 0
	}
}
