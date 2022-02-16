resource "aws_route_table" "ansibleRouteTable" {
	vpc_id = aws_vpc.myVPC.id
	
	route {
	 cidr_block = "0.0.0.0/0"
	 gateway_id = aws_internet_gateway.igwFrontEnd.id
	}

}

resource "aws_route_table" "minikubeRouteTable" {
	vpc_id = aws_vpc.myVPC.id
	
	route {
	 cidr_block = "0.0.0.0/0"
	 gateway_id = aws_internet_gateway.igwFrontEnd.id
	}

}

resource "aws_route_table" "jenkinsRouteTable" {

	vpc_id = aws_vpc.myVPC.id
	
	route {
	 cidr_block = "0.0.0.0/0"
	 gateway_id = aws_internet_gateway.igwFrontEnd.id
	}	
}

resource "aws_route_table_association" "minikubeAssoc" {

	subnet_id = aws_subnet.minikube.id
	route_table_id = aws_route_table.minikubeRouteTable.id
}


resource "aws_route_table_association" "ansibleAssoc" {

	subnet_id = aws_subnet.ansible.id
	route_table_id = aws_route_table.ansibleRouteTable.id
}

resource "aws_route_table_association" "jenkRTSub" {

	subnet_id = aws_subnet.jenkins.id
	route_table_id = aws_route_table.jenkinsRouteTable.id
}
