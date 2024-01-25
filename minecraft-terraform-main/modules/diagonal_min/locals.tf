locals {
  x_values = range(var.position.x, var.position.x + var.dimensions.width)
  y_values = range(var.position.y, var.position.y + var.dimensions.height)
  z_values = range(var.position.z, var.position.z + var.dimensions.length)
 
width_expansion = var.width_expansion
diagonal_length = var.dimensions.width

  diagonal_coordinates_min = [
    for idx in range(local.diagonal_length * (local.width_expansion)) : {
      x = local.x_values[idx % local.diagonal_length] + floor(idx / local.diagonal_length)
      y = local.y_values[idx % local.diagonal_length]
      z = local.z_values[idx % local.diagonal_length]
    }
  ]

  blocks = [
    for coord in local.diagonal_coordinates_min : {
      x = coord.x  
      y = coord.y
      z = -coord.z
    }
  ]

  material = length(regexall("^[a-z]+:[a-z]+$", var.material)) > 0 ? var.material : format("%s:%s", "minecraft", var.material)

}