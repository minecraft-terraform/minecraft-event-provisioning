locals {
  x_values = range(var.position.x, var.position.x + var.dimensions.width)
  y_values = range(var.position.y, var.position.y + var.dimensions.height)
  z_values = range(var.position.z, var.position.z + var.dimensions.length)

  top_coordinates    = setproduct(local.x_values, tolist([var.position.y]), local.z_values)
  bottom_coordinates = setproduct(local.x_values, tolist([var.position.y + var.dimensions.height - 1]), local.z_values)
  front_coordinates  = setproduct(tolist([var.position.x]), local.y_values, local.z_values)
  back_coordinates   = setproduct(tolist([var.position.x + var.dimensions.width - 1]), local.y_values, local.z_values)

  coordinates = concat(local.front_coordinates, local.back_coordinates, local.top_coordinates, local.bottom_coordinates)



  blocks   = [for coordinate in local.coordinates : zipmap(["x", "y", "z"], coordinate)]
  material = length(regexall("^[a-z]+:[a-z]+$", var.material)) > 0 ? var.material : format("%s:%s", "minecraft", var.material)
}