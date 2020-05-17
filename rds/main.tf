resource "aws_db_instance" "myRDS" {
	name 				= "myDB"
	identifier 			= "database-1"
	instance_class 		= "db.t2.micro"
	engine 				= "mariadb"
	engine_version 		= "10.2.21"
	username 			= "bob"
	password 			= "password1234"
	port 				= 3306
	allocated_storage 	= 20
	skip_final_snapshot = true
}

