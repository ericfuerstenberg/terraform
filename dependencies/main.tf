resource "aws_instance" "web" {
    ami = "${var.ami}"
    instance_type = "t2.micro"
    tags = {
        Name = "Web Server"
    }
    depends_on = ["aws_instance.db-server"] // this allows us to specify that we want the DB server up and running before making the web server
}

resource "aws_instance" "db-server" {
    ami = "${var.ami}"
    instance_type = "t2.micro"
    tags = {
        Name = "DB Server"
    }
}