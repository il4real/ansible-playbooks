
resource "aws_subnet" "wp-subnet" {
  vpc_id                  = aws_vpc.wordpress.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "eu-central-1a"

  tags = {
    Name = "wp-subnet"
  }
}