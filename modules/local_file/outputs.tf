output "id" {
  value = var.is_sensitive ? local_sensitive_file.sensitive_file[0].id : local_file.file[0].id
}