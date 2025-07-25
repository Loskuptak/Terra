variable "region" {
  description = "AWS region kde se vytvoří instance."
  type        = string
  default     = "eu-central-1"

 }

variable "instance_type" {
  description = "typ instance"
  type        = string
  default     = "t3.micro"
   
 }


variable "prefix" {
    description = "Prefix"
    type        = string
    default     = "terra"
  }

variable "environment" {
    description = "Environment"
    type        = string
    default     = "test"
    
  }

variable "kurz" {
    description = "Kurz"
    type        = string
    default     = "DevOps"
    
  }

variable "public_key_path" {
  description = "Cesta k veřejnému SSH klíči"
  type        = string
  default     = "C:/Users/START/.ssh/terra-key.pub"
}

variable "key_name" {
  description = "Název SSH klíče"
  type        = string
  default     = "terra-key"
}

variable "instance_count" {
  description = "Počet EC2 instancí"
  type        = number
  default     = 2
}
