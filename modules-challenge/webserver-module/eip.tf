// Assign an elastic IP to webserver for a static IP
resource "aws_eip" "elastic-ip" {
    instance = "${aws_instance.webserver.id}"
}

// Get the public IP of the Webserver as output
output "Webserver Public IP" {
    value = "${aws_eip.elastic-ip.public_ip}"
}
