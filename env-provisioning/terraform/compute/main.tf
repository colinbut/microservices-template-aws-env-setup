locals {
  ami     = "${lookup(var.region_to_ami_map, terraform.workspace, "ami-0bbc25e23a7640b9b")}"
  keypair = "${lookup(var.region_to_keypair_map, terraform.workspace, "MyIrelandKP")}"
}

module "networking" {
  source = "../networking/"  
}


resource "aws_instance" "MicroservicesTemplateLB" {
  ami                         = "${local.ami}"
  instance_type               = "${var.ec2_instance_type}"
  subnet_id                   = module.networking.subnet_id
  vpc_security_group_ids      = [module.networking.LoadBalancerSecurityGroupId]
  associate_public_ip_address = true
  key_name                    = "${local.keypair}"
  tags = {
      Name = "MicroserviceTemplateLB"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install httpd -y",
      "sudo service httpd start",
      "sudo chkconfig httpd on"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      host        = "${aws_instance.MicroservicesTemplateLB.public_ip}"
      private_key = file("~/dev/aws/MyIrelandKP.pem")
    }
  }
}

resource "aws_instance" "MicroservicesTemplateWeb01" {
  ami = "${local.ami}"
  instance_type = "${var.ec2_instance_type}"
  subnet_id = module.networking.subnet_id
  vpc_security_group_ids = [module.networking.WebDMZSecurityGroupId]
  associate_public_ip_address = true
  key_name = "${local.keypair}"
  tags = {
      Name = "MicroserviceTemplateWeb01"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install java-1.8.0-openjdk -y"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      host        = "${aws_instance.MicroservicesTemplateWeb01.public_ip}"
      private_key = file("~/dev/aws/MyIrelandKP.pem")
    }
  }
}

resource "aws_instance" "MicroservicesTemplateWeb02" {
  ami = "${local.ami}"
  instance_type = "${var.ec2_instance_type}"
  subnet_id = module.networking.subnet_id
  vpc_security_group_ids = [module.networking.WebDMZSecurityGroupId]
  associate_public_ip_address = true
  key_name = "${local.keypair}"
  tags = {
      Name = "MicroserviceTemplateWeb02"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install java-1.8.0-openjdk -y"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      host        = "${aws_instance.MicroservicesTemplateWeb02.public_ip}"
      private_key = file("~/dev/aws/MyIrelandKP.pem")
    }
  }
}

resource "aws_instance" "MicroservicesTemplateWeb03" {
  ami = "${local.ami}"
  instance_type = "${var.ec2_instance_type}"
  subnet_id = module.networking.subnet_id
  vpc_security_group_ids = [module.networking.WebDMZSecurityGroupId]
  associate_public_ip_address = true
  key_name = "${local.keypair}"
  tags = {
      Name = "MicroserviceTemplateWeb03"
  }

  # to be replaced with Ansible - as this part is more of configuration management
  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install java-1.8.0-openjdk -y"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      host        = "${aws_instance.MicroservicesTemplateWeb03.public_ip}"
      private_key = file("~/dev/aws/MyIrelandKP.pem")
    }
  }
}
