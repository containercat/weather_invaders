extends Node2D
enum { POT, SAPLING, LEAVES, BLOSSOMED }
export var gravity = 0.2
export var move_speed = 0.2

var flower_sprite_scene = preload("res://scenes/FlowerSprite.tscn")
#new vars
var height = 0
var sprite
var flower_size
var index = 0



func _process(delta):
    translate(Vector2(move_speed, gravity))

func change_direction():
    move_speed *= -1
    

func _ready():
    # get nodes
    sprite = get_node("FlowerSprite")
    flower_size = sprite.get_node("StaticBody2D/CollisionShape2D").shape.extents

func add_water():
    grow()

func grow():
    height += 1

    var flower_sprite = flower_sprite_scene.instance()
    flower_sprite.position.y = -height * flower_size.y
    add_child(flower_sprite)



