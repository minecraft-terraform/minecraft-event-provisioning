locals {
  x_values = range(var.position.x, var.position.x + var.dimensions.width)
  y_values = range(var.position.y, var.position.y + var.dimensions.height)
  z_values = range(var.position.z, var.position.z + var.dimensions.length)

  top_coordinates    = setproduct(local.x_values, tolist([var.position.y]), local.z_values)
  bottom_coordinates = setproduct(local.x_values, tolist([var.position.y + var.dimensions.height - 1]), local.z_values)
  left_coordinates  = setproduct(local.x_values, local.y_values, tolist([var.position.z]))
  right_coordinates = setproduct(local.x_values, local.y_values, tolist([var.position.z + var.dimensions.length - 1]))

  coordinates = concat(local.top_coordinates, local.bottom_coordinates, local.left_coordinates, local.right_coordinates)

  blocks   = [for coordinate in local.coordinates : zipmap(["x", "y", "z"], coordinate)]
  material = length(regexall("^[a-z]+:[a-z]+$", var.material)) > 0 ? var.material : format("%s:%s", "minecraft", var.material)
}