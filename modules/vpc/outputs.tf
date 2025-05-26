output "vpc_id" {
    value = aws.vpc.main.id
}

output "public_subnet_id" {
    value = aws_subnet.public_subnet_id
}