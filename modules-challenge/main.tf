// Create a DB webserver and get private IP as output
module "db-module" {
  source = "database-module"
}

// Create a webserver with a security group that allows HTTP & HTTPS traffic, a static IP (elastic IP), and get public IP as output
module "webserver" {
  source = "webserver-module"
}
