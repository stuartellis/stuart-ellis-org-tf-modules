variable "root_email" {
  type = string
}

variable "projects" {
  type = object({
    name  = string
    email = string
  })
}
