# resource "aws_ebs_volume" "server" {
#     availability_zone = data.aws_subnet.server.availability_zone
#     type              = "gp2"
#     size              = 200
# }

# resource "aws_volume_attachment" "server" {
#     device_name = "/dev/sdh"
#     volume_id   = aws_ebs_volume.server.id
#     instance_id = aws_instance.server.id
# }