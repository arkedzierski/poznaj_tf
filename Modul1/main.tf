resource "random_string" "randomname" {
  length  = 8
  special = false
}

resource "local_file" "randomname" {
  content         = "test random"
  filename        = "files/${random_string.randomname.result}.txt"
  file_permission = "0777"
}

resource "local_file" "myname" {
  content         = "test my"
  filename        = "files/myanme.txt"
  file_permission = "0600"
}