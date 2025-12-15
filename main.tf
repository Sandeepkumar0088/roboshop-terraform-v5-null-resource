resource "aws_instance" "instance" {
    for_each               = var.components
    ami                    = var.ami
    instance_type          = var.instance_type
    vpc_security_group_ids = var.vpc_security_group_ids

    tags = {
        Name = each.key
    }
}

resource "aws_route53_record" "dns_records" {
    for_each = var.components
    zone_id  = var.zone_id
    name     = "${each.key}-dev"
    type     = "A"
    ttl      = 30
    records  = [aws_instance.instance[each.key].private_ip]
}


resource "null_resource" "ansible" {
    for_each   = var.components
    provisioner "remote-exec" {
        connection {
            type      = "ssh"
            user      = "ec2-user"
            password  = "DevOps321"
            host      = aws_instance.instance[each.key].private_ip
        }

        inline = [
            "sudo dnf install python3.13-pip -y",
            "sudo pip3.13 install ansible",
            "ansible-pull -i localhost, -U https://github.com/Sandeepkumar0088/roboshop-ansible-roles-v2.git main.yml -e component=${each.key} -e env=dev"
        ]

    }
}