variable "position" {
  type = object({
    x = number
    y = number
    z = number
  })
}

variable "dimensions" {
  type = object({
    width  = number
    length = number
    height = number
  })
}

variable "material" {
  type = string
}

variable "width_expansion" {
  description = "Factor to control width expansion of the diagonal line"
  type        = number
  # default     = 1  # Set a default value or adjust as needed
}