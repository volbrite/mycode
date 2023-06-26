variable "container_name" {
  description = "Value of the name for the Docker container"
  # basic types include string, number and bool
  type        = string
  default     = "ExampleNginxContainer"
}

variable "internal_port" {
  description = "Internal port"
  type        = number
  default     = 80
}

variable "external_port" {
  description = "external port"
  type        = number
  default     = 2224
}
