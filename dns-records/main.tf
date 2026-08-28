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
    frontend    = "10.0.1.8"
    mongodb     = "10.0.1.4"
    catalogue   = "10.0.1.6"
    user        = "10.0.1.9"
    redis       = "10.0.1.12"
    cart        = "10.0.1.13"
    mysql       = "10.0.1.11"
    shipping    = "10.0.1.7"
    rabbitmq    = "10.0.1.10"
    payment     = "10.0.1.5"
  }
}
