resource "aws_vpc_peering_connection_accepter" "mongodb_atlas" {
  vpc_peering_connection_id = "pcx-053d00d2862dad4c1"
  auto_accept               = true
}

resource "aws_route" "mongodb_atlas" {
  route_table_id            = aws_vpc.main.main_route_table_id
  destination_cidr_block    = "192.168.248.0/21"
  vpc_peering_connection_id = aws_vpc_peering_connection_accepter.mongodb_atlas.id
}

resource "aws_security_group_rule" "mongodb_atlas" {
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  cidr_blocks       = ["192.168.248.0/21"]
  security_group_id = aws_security_group.http.id
}
