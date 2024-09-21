resource "aws_network_acl" "main" {
  vpc_id = aws_vpc.main.id

  egress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "192.168.248.0/21"
    from_port  = 27017
    to_port    = 27017
  }

  tags = {
    Name = "${var.namespace}-${var.environment}-nacl"
  }
}

resource "aws_network_acl_association" "main" {
  count          = local.azs_count
  subnet_id      = aws_subnet.public[count.index].id
  network_acl_id = aws_network_acl.main.id
}
