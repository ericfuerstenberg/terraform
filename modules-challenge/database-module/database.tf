// Define which AMI we want to use for our DB server
variable "ami" {
    type = "string"
    default ="ami-06fcc1f0bc2c8943f"
}

// Create a database server and get the private IP as output
resource "aws_instance" "db-server" {
    ami = "${var.ami}"
    instance_type = "t2.micro"
    tags = {
        Name = "db-server"
    }
}

// Get private IP of database server & public IP of webserver (elastic IP) as output
output "DB Private IP" {
  value = "${aws_instance.db-server.private_ip}"
}
