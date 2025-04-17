output "instance_public_ips" {
    value = { for instance in aws_instance.servers : instance.tags["Name"] => instance.public_ip }
    description = "Public IP addresses of all servers"
}

output "ami_id" {
    value = data.aws_ami.ami.id
    description = "AMI ID used for the instances"  
}
output "instance_types" {
    value = { for instance in aws_instance.servers : instance.tags["Name"] => instance.instance_type }
    description = "Instance types of all servers"
}
output "name" {
    value = { for instance in aws_instance.servers : instance.tags["Name"] => instance.tags["Name"] }
    description = "Names of all servers"
  
}