resource "aws_security_group" "service_security_group" {
  vpc_id = data.aws_vpc.vpcid.id
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.vpcid.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  name = "${var.application}-${var.environment}-ecs-sg"
}