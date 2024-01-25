resource "minecraft_block" "stone" {
  material = "minecraft:stone"

  position = {
    x = -47,
    y = 65,
    z = 30
  }
}

# module "name" {
#   source = "./cube"

#   material = "cobblestone"

#   position = {
#     x = 10,
#     y = 75,
#     z = -100
#   }

#   dimensions = {
#     width  = 1,
#     length = 6,
#     height = 5
#   }
# }

# module "pig" {
#  source = "./entity"

#  entity = "pig"

#  amount=3

#    x = 224,
#    y = 81,
#    z = 2024
#   }

# }


#For Music Event
# resource "minecraft_block" "noteblock" {
#   material = "note_block[note=7]"

#   position = {
#     x = 0,
#     y = -60,
#     z = 0
#   }
# }

# resource "minecraft_block" "redstone" {
#   material = "redstone_wire"

#   position = {
#     x = 1,
#     y = -60,
#     z = 0
#   }
# }

# resource "minecraft_block" "mechanism" {
#   material = "stone_button"

#   position = {
#     x = 2,
#     y = -60,
#     z = 0
#   }
# }

