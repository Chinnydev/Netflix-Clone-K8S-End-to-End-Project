resource "aws_instance" "servers" {
    ami = data.aws_ami.ami.id
    for_each = tomap(var.instance_type)
    instance_type = each.value
    key_name = "ansible_key"
    security_groups = ["ansible_tower_sg"]

    tags = {
      Name = each.key
    }

    root_block_device {
        volume_size = var.root_volume_size[each.key].volume_size
        volume_type = var.root_volume_size[each.key].volume_type
        delete_on_termination = true
        encrypted = false
        iops = 3000
    }
      
}
