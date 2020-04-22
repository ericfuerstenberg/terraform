// Define which AMI we want to use for our web server
variable "ami" {
    type = "string"
    default ="ami-06fcc1f0bc2c8943f"
}

// Create a webserver 
resource "aws_instance" "webserver" {
    ami = "${var.ami}"
    instance_type = "t2.micro"
    tags = {
        Name = "web-server"
    }
    user_data = "${file("./webserver-module/original.sh")}"
    security_groups = ["${aws_security_group.security-group.name}"]
}
