extends Node

var offset = Vector2(50, 150)

var flower_scene = preload("res://scenes/Flower.tscn")

var points_label
var points = 0

func _ready():
    points_label = get_node("../Points")

    var window_size = OS.get_window_size()
    var width = window_size.x
    var height = window_size.y

    var temp_flower = flower_scene.instance()
    var flower_size = temp_flower.get_node("Sprite").texture.get_size()
    var flower_width = flower_size.x

    var space_between = 100
    var flower_amount = width / (flower_width + space_between)

    var y = height - offset.y

    for i in flower_amount:
        var x = i * (flower_width + space_between) + offset.x

        var flower = flower_scene.instance()
        flower.position = Vector2(x, y)
        flower.scale *= 2

        get_node("Flowers").add_child(flower)

func _process(delta):
    points_label.text = str(points)