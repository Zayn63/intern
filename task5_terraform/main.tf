resource "aws_instance" "zconviction" {
  ami           = "ami-02d26659fd82cf299"
  instance_type = "t2.micro"
  key_name      = "zayn-key"
  subnet_id     = "subnet-086c3ae98cdde3671"
  security_groups = ["sg-0449336e4644cdbb3"]

  user_data = <<-EOF
    #!/bin/bash
    sudo apt update
    sudo apt install -y docker.io
    sudo systemctl start docker
    sudo systemctl enable docker
    docker pull ${var.docker_image}
    docker run -d -p 1337:1337 ${var.docker_image}
  EOF

  tags = {
    Name = "zconviction"
  }
}
