resource "aws_internet_gateway" "bg-igw" {
  vpc_id = aws_vpc.wordpress.id
  tags = {
    Name = "bg-igw"
  }
}

resource "aws_route_table" "bg-pub-crt" {
  vpc_id = aws_vpc.wordpress.id

  route {
    //associated subnet can reach everywhere
    cidr_block = "0.0.0.0/0"

    //CRT uses this IGW to reach internet
    gateway_id = aws_internet_gateway.bg-igw.id
  }

  tags = {
    Name = "bg-pub-crt"
  }
}

resource "aws_route_table_association" "bg-crta-pub-subnet-1" {
  subnet_id      = aws_subnet.wp-subnet.id
  route_table_id = aws_route_table.bg-pub-crt.id
}