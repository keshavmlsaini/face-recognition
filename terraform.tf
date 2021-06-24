resource "aws_instance" "webos1" {
  ami           = "ami-011c99152163a87ae"
  instance_type = "t2.micro"
  security_groups =  [ "webport-allow" ]
  key_name = "awsst2021"

  tags = {
    Name = "Web Server by TF"
  }



}

resource "aws_ebs_volume" "example" {
  availability_zone = aws_instance.webos1.availability_zone
  size              = 1

  tags = {
    Name = "Web Server HD by TF"
  }
}
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdc"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.webos1.id
  force_detach = true
}
