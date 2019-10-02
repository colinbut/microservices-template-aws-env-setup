output "LB_ServerDns" {
  value = "${aws_instance.MicroservicesTemplateLB.public_dns}"
}

output "Web01_ServerDns" {
  value = "${aws_instance.MicroservicesTemplateWeb01.public_dns}"
}

output "Web02_ServerDns" {
  value = "${aws_instance.MicroservicesTemplateWeb02.public_dns}"
}

output "Web03_ServerDns" {
  value = "${aws_instance.MicroservicesTemplateWeb03.public_dns}"
}