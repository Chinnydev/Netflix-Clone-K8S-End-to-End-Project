variable "instance_type" {
    type = map(string)
    description = "This is a map of the instance types"
    default = {
    Jenkins = "t2.large",
    Monitoring = "t2.medium",
    K8s_master = "t2.medium",
    K8s_worker = "t2.medium"

  }
}

variable "root_volume_size" {
  type = map(object({
    volume_type= string
    volume_size = number
  }))
  description = "This is the size of the root volume in GB"
  default = {
    Jenkins = {
      volume_type = "gp3"
      volume_size = 35
    }
    Monitoring = {
      volume_type = "gp3"
      volume_size = 15
    }
    K8s_master = {
      volume_type = "gp3"
      volume_size = 15
    }
    K8s_worker = {
      volume_type = "gp3"
      volume_size = 15
    }
  }
}

