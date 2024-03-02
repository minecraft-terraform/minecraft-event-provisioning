# minecraft-event-provisioning


## secret start block

```

resource "minecraft_block" "muziek_start" {
  material = "oak_button[face=ceiling]"

  position = {
    x = var.start_x
    y = -60
    z = var.z
  }
}

```
