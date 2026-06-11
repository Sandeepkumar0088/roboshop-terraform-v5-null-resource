variable "ami"{
    default = "ami-0220d79f3f480ecf5"
}

variable "instance_type"{
    default = "t3.micro"
}

variable "vpc_security_group_ids" {
    default = [ "sg-03dfc56f63b6d06c5" ]
}


variable "zone_id" {
    default = "Z03369982K8R0OHQ4XJJV"
}

variable "components" {
    default = {
        frontend  = ""
        mongodb   = ""
        catalogue = ""
        redis     = ""
        user      = ""
        cart      = ""
        mysql     = ""
        shipping  = ""
        rabbitmq  = ""
        payment   = ""
        dispatch  = ""
    }
}
