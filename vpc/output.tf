output "cidr_block" {
    value = var.cidr_block
}
output "vpc_id" {
  value = aws_vpc.prod.id
}
output "public_subnets" {
  value = aws_subnet.private[*].id
}
output "private_subnets" {
  value = aws_subnet.public[*].id
}











