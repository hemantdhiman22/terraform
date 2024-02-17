output "cidr_block" {
    value = var.cidr_block
}
output "vpc_id" {
  value = aws_vpc.prod.id
}

output "private_az-1_id" {
  value = aws_subnet.private_az-1.id
}
output "private_az-2_id" {
  value = aws_subnet.private_az-2.id
}
output "private_az-3_id" {
  value = aws_subnet.private_az-3.id
}
output "private_az-4_id" {
  value = aws_subnet.private_az-4.id
}
output "private_az-5_id" {
  value = aws_subnet.private_az-5.id
}
output "private_az-6_id" {
  value = aws_subnet.private_az-6.id
}

output "public_az-1_id" {
  value = aws_subnet.public_az-1.id
}
output "public_az-2_id" {
  value = aws_subnet.public_az-2.id
}
output "public_az-3_id" {
  value = aws_subnet.public_az-3.id
}
output "public_az-4_id" {
  value = aws_subnet.public_az-4.id
}
output "public_az-5_id" {
  value = aws_subnet.public_az-5.id
}
output "public_az-6_id" {
  value = aws_subnet.public_az-6.id
}









