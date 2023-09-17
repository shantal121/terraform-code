provider "aws" {
region = "aws_lightsail_instance" "example" 
}
  name              = "example-instance"
  availability_zone = "us-east-1a" 
  blueprint_id      = "amazon-linux-2-lts"
  bundle_id         = "nano_2_0"

  user_data = <<-EOF
              #!/bin/bash
              sudo yum install httpd -y
              sudo systemctl start httpd
              sudo systemctl enable httpd
              sudo sh -c 'echo "<h1>This Server is created using Terraform </h1>" >> /var/www/html/index.html'
              EOF
}

output "public_ip" {
  value = aws_lightsail_instance.example.public_ip_address
}








  