output "subnet_id" {
  value = "${aws_subnet.public-subnet-A.id}"
}

output "LoadBalancerSecurityGroupId" {
  value = "${aws_security_group.LBSG.id}"
}

output "WebDMZSecurityGroupId" {
  value = "${aws_security_group.WebDMZ.id}"
}

