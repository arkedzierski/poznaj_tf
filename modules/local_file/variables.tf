variable "filename" {
  type        = string
  description = "File name"
}

variable "content" {
  type        = string
  description = "File content"
  default     = ""
}

variable "file_permissions" {
  type        = string
  description = "File permission"
  default     = "0644"
}

variable "is_sensitive" {
  type        = bool
  description = "Sensitive file"
  default     = false
}

variable "content_base64" {
  type        = string
  description = "File content"
  default     = ""
}
