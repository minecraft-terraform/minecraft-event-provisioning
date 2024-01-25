locals {
  x_values = range(var.position.x, var.position.x + var.dimensions.width)
  y_values = range(var.position.y, var.position.y + var.dimensions.height)
  z_values = range(var.position.z, var.position.z + var.dimensions.length)
 
width_expansion = var.width_expansion

coordinates = [
    for idx in range(min(length(local.x_values), length(local.y_values))) : {
      x = local.x_values[idx]
      y = local.y_values[idx]
      z = local.z_values[0]
    }
  ]

  expanded_coordinates = flatten([
    for idx in range(local.width_expansion) : [
      for coord in local.coordinates : {
        x = coord.x 
        y = coord.y 
        z = coord.z + idx
      }
    ]
  ])

  combined_stairs_coordinates = concat(local.coordinates, local.expanded_coordinates)

  blocks = [
    for coordinate in local.combined_stairs_coordinates : {
      x = coordinate.x
      y = coordinate.y
      z = coordinate.z
      material = var.material
    }
  ]

  material = length(regexall("^[a-z]+:[a-z]+$", var.material)) > 0 ? var.material : format("%s:%s", "minecraft", var.material)

}