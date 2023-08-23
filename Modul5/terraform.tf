module "newfile" {
  source           = "../modules/local_file"
  filename         = "test.txt"
  content          = "testowy plik"
  file_permissions = "755"
}

# module "file_sensitive" {
#   source         = "../modules/local_file"
#   filename       = "test_sensitive.txt"
#   content_base64 = "testowy plik sensitive"
#   is_sensitive   = true
# }

# module "newfile1" {
#   source           = "../modules/local_file"
#   filename         = "test1.txt"
#   content          = "testowy plik"
#   file_permissions = "755"
# }

module "file_sensitive1" {
  source         = "../modules/local_file"
  filename       = "test_sensitive1.txt"
  content_base64 = "testowy plik sensitive"
  is_sensitive   = true
}