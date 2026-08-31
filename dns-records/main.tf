provider "aws" {
  region = "us-east-1"
}


resource "aws_route53_record" "dns_records" {
  for_each = var.components
  zone_id  = var.zone_id
  name     = "${each.key}-dev"
  type     = "A"
  ttl      = 30
  records  = [each.value]
}

variable "zone_id" {
  default = "Z03809721NR4CZZKYMR0T"
}

variable "components" {
  default = {
    cart        = "10.0.1.8"
    catalogue   = "10.0.1.9"
    frontend    = "10.0.1.5"
    mongodb     = "10.0.1.10"
    mysql       = "10.0.1.13"
    payment     = "10.0.1.6"
    rabbitmq    = "10.0.1.7"
    redis       = "10.0.1.4"
    shipping    = "10.0.1.11"
    user        = "10.0.1.12"
  }
}
