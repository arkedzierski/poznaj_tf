moved {
  from = local_file.local_file
  to   = local_file.file
}

resource "local_file" "file" {
  count = var.is_sensitive ? 0 : 1

  content  = var.content_base64 == "" ? var.content : base64encode(var.content_base64)
  filename = var.filename
}

moved {
  from = local_sensitive_file.local_sensitive_file
  to   = local_sensitive_file.sensitive_filee
}

resource "local_sensitive_file" "sensitive_file" {
  count = var.is_sensitive ? 1 : 0

  content  = var.content_base64 == "" ? var.content : base64encode(var.content_base64)
  filename = var.filename
}
