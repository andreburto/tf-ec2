data "aws_vpc" "default" {
    id = var.vpc_id
}

data "aws_subnet" "server" {
    id = var.selected_subnet_id
}

resource "aws_security_group" "server" {
    name        = "${local.project_name}_sg"
    description = "Manage EC2 traffic"
    vpc_id      = data.aws_vpc.default.id

    ingress {
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }
}