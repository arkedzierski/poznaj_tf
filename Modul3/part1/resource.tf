variable "files" {
  description = "List of objects with files names, content and permission - { name = \"<nazwa-pliku>\", content = \"<zawartosc-pliku>\", file_permissions = \"<uprawnienia>\" }"
  type = list(object({
    name             = string,
    content          = string,
    file_permissions = string
  }))
  default = []
}

resource "local_file" "file" {
  count           = length(var.files)
  content         = var.files[count.index]["content"]
  filename        = "../files/${var.files[count.index]["name"]}"
  file_permission = var.files[count.index]["file_permissions"]

}