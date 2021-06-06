variable "root_email" {
  type = string
}

variable "projects" {
  type = list(object({
    name  = string
    email = string
  }))
}
