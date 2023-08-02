module "file" {
  source           = "git::https://github.com/arkedzierski/poznaj_tf.git//modules/local_file?ref=dev"
  filename         = "test.txt"
  content          = "testowy plik"
  file_permissions = "755"
}

module "file_sensitive" {
  source         = "git::https://github.com/arkedzierski/poznaj_tf.git//modules/local_file?ref=dev"
  filename       = "test_sensitive.txt"
  content_base64 = "testowy plik sensitive"
  is_sensitive   = true
}