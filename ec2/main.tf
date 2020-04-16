resource "aws_instance" "cloud" {
    ami = "${var.ami}"
    instance_type = "t2.micro"
}
