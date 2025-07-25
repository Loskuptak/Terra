
variable "instance_type" {
  description = "typ instance"
  type        = string
}

variable "key_name" {
  description = "Název SSH klíče"
  type        = string
}

variable "instance_count" {
  description = "Počet EC2 instancí"
  type        = number
  default     = 1
}

variable "prefix" {
  description = "Prefix"
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
}

variable "kurz" {
  description = "Kurz"
  type        = string
}

variable "public_key_path" {
  description = "Path to public SSH key"
  type        = string
}
