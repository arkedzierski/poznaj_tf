locals {
  additional_files = ["plik4.txt", "plik5.txt"]

  additional_files1 = {
    "plik6" = {
      filename        = "plik6.txt",
      content         = "Ćwiczenie 2.3 - Pętle! Plik 6",
      file_permission = "0600"
    },
    "plik7" = {
      filename        = "plik7.txt",
      content         = "Ćwiczenie 2.3 - Pętle! Plik 7",
      file_permission = "0700"
    }
  }
  files = ["plik1.txt", "plik2.txt", "plik3.txt"]
}

resource "local_file" "additional_file" {
  for_each = toset(local.additional_files)

  filename = each.key
  content  = "Ćwiczenie 2.3 - Pętle! Plik ${each.value}"
}

resource "local_file" "additional_file1" {
  for_each = local.additional_files1

  filename        = each.value["filename"]
  content         = "Ćwiczenie 2.3 - Pętle! Plik ${each.value["content"]}"
  file_permission = each.value["file_permission"]
}


locals {
  transformed_names = [for name in local.files : upper(name)]
}

resource "local_file" "transformed_file1" {
  count = length(local.files)

  filename = local.transformed_names[count.index]
  content  = "Ćwiczenie 2.3 - Pętle! Plik ${local.transformed_names[count.index]}"
}
