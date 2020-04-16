
// Create a database server and get the private IP as output
resource "aws_instance" "db-server" {
    ami = "${var.ami}"
    instance_type = "t2.micro"
    tags = {
        Name = "db-server"
    }
}

// Create a webserver and assign an elastic IP so that it has a fixed public IP.
// Get the public IP of the Webserver as output
// Assign the security group to the webserver
resource "aws_instance" "webserver" {
    ami = "${var.ami}"
    instance_type = "t2.micro"
    tags = {
        Name = "webserver"
    }
    user_data = "${file("original.sh")}"
    security_groups = ["${aws_security_group.allow-http-https.name}"]
}

resource "aws_eip" "elastic-ip" {
    instance = "${aws_instance.webserver.id}"
}

// Create a security group for the webserver. Open ports 80 and 443 (HTTP & HTTPS)
resource "aws_security_group" "allow-http-https" {
    name = "allow-http-https"
    description = "Allow HTTP & HTTPS"

    ingress {
        from_port = 80
        to_port = 80
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "tcp"
    }

    ingress {
        from_port = 443
        to_port = 443
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "tcp"
    }

    egress {
        from_port = 80
        to_port = 80
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "tcp"

    }

    egress {
        from_port = 443
        to_port = 443
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "tcp"

    }    
    
}

// Get private IP of database server & public IP of webserver (elastic IP) as output
output "DB Private IP" {
  value = "${aws_instance.db-server.private_ip}"
}

output "Webserver Public IP" {
    value = "${aws_eip.elastic-ip.public_ip}"
}

