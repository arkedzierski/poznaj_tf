variable "files" {
  description = "List of objects with files names, content and permission - { name = \"<nazwa-pliku>\", file_permissions = \"<uprawnienia>\" }"
  type = list(object({
    name             = string,
    file_permissions = string
  }))
  default = []
}

data "local_file" "files" {
  count    = length(var.files)
  filename = "../files/${var.files[count.index]["name"]}"
}

resource "local_sensitive_file" "file" {
  count    = length(var.files)
  content  = data.local_file.files[count.index].content
  filename = "../sensitive_file/${element(split("/", data.local_file.files[count.index].filename), 2)}"
  # filename = "../sensitive_file/${data.local_file.files[count.index].filename}"
  file_permission = var.files[count.index]["file_permissions"]
  lifecycle {
    prevent_destroy = true
  }
}