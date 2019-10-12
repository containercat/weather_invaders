extends StaticBody2D

enum { POT, SAPLING, LEAVES, BLOSSOMED }

var pot_texture = preload("res://assets/pot.png")
var sapling_texture = preload("res://assets/sapling.png")
var leaves_texture = preload("res://assets/leaves.png")
var blossomed_texture = preload("res://assets/blossomed.png")

var status
var sprite

func _ready():
    status = POT
    sprite = get_node("CollisionShape2D/Sprite")

func grow():
    match status:
        POT:
            sprite.texture = sapling_texture
            status = SAPLING
        SAPLING:
            sprite.texture = leaves_texture
            status = LEAVES
        LEAVES:
            sprite.texture = blossomed_texture
            status = BLOSSOMED
        BLOSSOMED:
            pass
