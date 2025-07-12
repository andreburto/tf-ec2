data "aws_key_pair" "server" {
    key_name   = var.key_name
}

resource "aws_instance" "server" {
    ami                         = data.aws_ami.ubuntu.id
    associate_public_ip_address = true
    iam_instance_profile        = aws_iam_instance_profile.server.name
    instance_type               = "t3.micro"
    key_name                    = data.aws_key_pair.server.key_name
    subnet_id                   = data.aws_subnet.server.id
    security_groups             = [aws_security_group.server.id]
    user_data                   = file("userdata.sh")

    root_block_device {
        volume_size = 100
        volume_type = "gp2"
        delete_on_termination = true
    }
}