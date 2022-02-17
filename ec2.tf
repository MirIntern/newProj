data "aws_ami" "amazonLinux" {
	owners = ["amazon"]
	most_recent = true
	
	filter {
	 name = "name"
	 values = ["amzn2-ami-hvm-*-x86_64-ebs"]
	}
}

resource "aws_launch_template" "t2microAnsibleTemplate" {
	image_id = data.aws_ami.amazonLinux.id
	instance_type = "t2.micro"
	network_interfaces {
	 associate_public_ip_address = true
	 security_groups = [aws_security_group.allowPort80Ingress.id, aws_security_group.ansibleServer.id, aws_security_group.allowAllEgress.id, aws_security_group.sshAccess.id]
	}
	key_name = "LoadBalancerPublic2"
	tags = {
		name = "Server"
	}
}

resource "aws_launch_template" "t3microMinikube" {
	image_id = "ami-04505e74c0741db8d"
	instance_type = "t3.micro"
	network_interfaces {
	 associate_public_ip_address = true
	 security_groups = [aws_security_group.allowPort80Ingress.id, aws_security_group.minikube.id, aws_security_group.allowAllEgress.id, aws_security_group.sshAccess.id]
	}
	key_name = "LoadBalancerPublic2"
	tags = {
		name = "Server"
	}
	block_device_mappings {
		device_name = "/dev/xvda"
		ebs {
			volume_size = 25
		}
		
	}
}

resource "aws_launch_template" "t2microTemplateJenk" {
	image_id = data.aws_ami.amazonLinux.id
	instance_type = "t2.micro"
	network_interfaces {
	 associate_public_ip_address = true
	 security_groups = [aws_security_group.allowPort80Ingress.id, aws_security_group.allowPort8080Ingress.id, aws_security_group.allowAllEgress.id, aws_security_group.sshAccess.id, aws_security_group.jenkins.id]
	}
	key_name = "LoadBalancerPublic2"
	tags = {
		name = "Jenkins"
	}
	user_data = filebase64("${path.module}/jenkinsdata.sh")
}

resource "aws_autoscaling_group" "minikubeServerScaleGrp" {
	desired_capacity = 1
	max_size = 1
	min_size = 1

	launch_template {
	 id = aws_launch_template.t3microMinikube.id
	 version = "$Latest"
	}

	vpc_zone_identifier = [aws_subnet.minikube.id]
}

resource "aws_autoscaling_group" "ansibleServerScaleGrp" {
	desired_capacity = 1
	max_size = 1
	min_size = 1

	launch_template {
	 id = aws_launch_template.t2microAnsibleTemplate.id
	 version = "$Latest"
	}

	vpc_zone_identifier = [aws_subnet.ansible.id]
}


resource "aws_autoscaling_group" "jenkinsServerScaleGrp" {
	desired_capacity = 1
	max_size = 1
	min_size = 1

	launch_template {
	 id = aws_launch_template.t2microTemplateJenk.id
	 version = "$Latest"
	}

	vpc_zone_identifier = [aws_subnet.jenkins.id]
}
