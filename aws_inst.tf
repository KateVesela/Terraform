
resource "aws_key_pair" "id_rsa" {
  key_name   = "id_rsa"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD5RGgAMELit9Ffc05old7fJt2gLDhReq1A2da9HahuNcBYtTtJnadQMcEdNbVO8u6ybiINngk76Nr/mJRdYlJGiW9XhlKs9qYspitmTTcc6M7ZNU5llgEA7GWOZsSQOeKm0wnzxN+xoDRpC5JDLkyf1cenBq+wjYzfWPnOXsaV41S3EKKc0Nz2l+3NaP5475lTm/X6YAdUugFctNfdF1q1J09C9tRvR6GQv5UgXsEnjPTUxQ+Gwj2Ij1TX68hhIOCAJv3/5ene+ek3IV2Sod8UfgaerCU9ccdvMJNH1UAWbibVbouqJn6LwOf3a+uFQDCZB3DyqQQ2WKp+IPnvBXHD kate@kate-VirtualBox"
}

resource "aws_instance" "ls_example" {
  ami = "ami-ae90b6cb"
  instance_type = "t2.micro"
  key_name = "id_rsa"
  subnet_id = "${aws_subnet.tf_subnet.id}"
  vpc_security_group_ids = ["sg-c920c6a1"]
  tags  {
  Name = "ln-instance"}
}


