variable "files_pods" {
  description = "zmienną wejściową files, która może przyjąć dowolną liczbę następujących obiektów: { name = <nazwa-pliku>, content = <zawartosc-pliku> }"
  type = set(
    object({
      name    = string
      content = string
    })
  )

  validation {
    condition     = alltrue([for files_pods in var.files_pods : endswith(files_pods["name"], ".txt")])
    error_message = "Nazwa pliku musi kończyć się na .txt!"
  }
  validation {
    condition     = length([for files_pods in var.files_pods : files_pods["content"]]) > 0
    error_message = "Plik nie moźe być pusty"
  }
}

locals {
  files_pods_list = tolist(var.files_pods)
  files_pods_each = {
    for item in var.files_pods : item["name"] => item
  }
}

resource "local_file" "files_pods_each" {
  for_each = local.files_pods_each
  filename = "each_${each.key}"
  content  = each.value["content"]
}

resource "local_file" "files_pods_count" {
  count = length(local.files_pods_list)

  filename = "count_${local.files_pods_list[count.index]["name"]}"
  content  = local.files_pods_list[count.index]["content"]
}
