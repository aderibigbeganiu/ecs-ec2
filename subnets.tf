data "aws_availability_zones" "available" { state = "available" }

locals {
  azs_count = 2
  azs_names = data.aws_availability_zones.available.names
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags   = { Name = "${var.namespace}-${var.environment}-rt-public" }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  
}

resource "aws_route_table_association" "public" {
  count          = local.azs_count
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_subnet" "public" {
  count                   = local.azs_count
  vpc_id                  = aws_vpc.main.id
  availability_zone       = local.azs_names[count.index]
  cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 8, 10 + count.index)
  map_public_ip_on_launch = true
  tags                    = { Name = "${var.namespace}-${var.environment}-public-${local.azs_names[count.index]}" }
}
