output "ip_address" {
  value = "${aws_instance.main[*].public_ip}"
}
