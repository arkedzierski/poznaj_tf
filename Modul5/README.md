# Zadanie podsumujące
## Opis
W ramach tego ćwiczenia spróbujesz samodzielnie wykorzystać zagadnienia z Modułu 5.

## Wykonanie ćwiczenia
Aby wykonać to ćwiczenie przygotuj samodzielnie konfigurację wg poniższych wytycznych:
* do tworzenia zasobów wykorzystaj zasób `local_file` oraz `local_sensitive_file`
* napisz moduł, który będzie tworzyć lokalny plik wg zadanych wytycznych (możliwość wskazania nazwy pliku, zawartości, uprawnień, czy plik wrażliwy)
* napisany moduł powinien także umożliwiać ustawienie zawartości z użyciem parametru `content_base64`. Użytkownik nie powinien jednak samodzielnie wykonywać konwersji zawartości
* moduł powinien być dostepny w ramach lokalnego systemu plików
* za pomocą modułu utwórz kilka plików, a następnie usuń jeden z nich

1. Tworzymy dwa pliki za pomocą istniejącego modułu `test.txt` i `test_sensitive.txt`.
2. Natępnie usuwamy zasób tworzący plik `test_sensitive.txt`

* zmień także identyfikator modułu dla jednego z utworzonych plików

3. Zmieniamy id `module "file"` na  `module "newfile"``

* wykorzystaj operacje `state mv` oraz `state rm` aby zmodyfikować plik stanu (`terraform plan` pokazuje brak zmian)

4. Zmiana id modułu wymusza ponowne wykonanie `terraform init`
5. `terraform plan` pokaze potrzebę utworzenia 2 obu plików ze względu na fakt usunięcia pliku test_sensitive.txt oraz stworzenia nowego pliku o id `module.newfile.local_file.file[0]` i zniszczenia istniejącego pliku o id `module.file.local_file.file[0]`.
6. Wykorzystjemy `state mv` to modyfikacji id w pliku stanu: `terraform state mv "module.file.local_file.file[0]" "module.newfile.local_file.file[0]"`. `terraform plan` pokaze tylko informacje o usunięciu i odtworzeniu pliku test_sensitive.txt 
7. Wykorzystujemy `state rm` aby usununąć z pliku stanu nieistniejący plik: `terraform state rm "module.file_sensitive.local_sensitive_file.sensitive_file[0]"`
8. `terraform plan` pokaze brak zmian

* dodaj kilka nowych plików a następnie usuń kilka z nich

9. Przywracamy usnięty zasób tworzący `test_sensitive.txt` i dodajemy nowe pliki `test1.txt` i `test_sensitive1.txt`
10. Usuwamy pliki: `rm test_sensitive.txt test1.txt`
11. `terraform plan -refresh=false` pokaze brak zmian.
12. `terraform plan -refresh-only` pokaze błąd: `The given key does not identify an element in this collection value: the collection has no elements.`

* wykorzystując operację `-refresh=false` oraz `-refresh-only` spróbuj ponownie rekoncyliować plik stanu

13. Komentujemy zasoby odpowiedzialne za brakujące pliki
14. `terraform plan -refresh-only` pokaze informację o usunięciu plików z pliku stanu
15. `terraform apply -refresh-only` usunie brakujące pliki z pliku stanu
16. Mozemy odkomentować zakomentowane zasoby i za pomocą `terraform plan` je odtworzyć.


## Pomocne linki
https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file
https://developer.hashicorp.com/terraform/language/modules/develop/refactoring