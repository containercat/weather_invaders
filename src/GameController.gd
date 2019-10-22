extends Node

var offset = Vector2(50, 150)

var flower_scene = preload("res://scenes/Flower.tscn")
var points_label
var points = 0
var flower_amount = 12
var window_size

var flowers = []


func _ready():
    points_label = get_node("../Points")
    window_size = OS.get_window_size()
    var width = window_size.x
    var height = window_size.y
    var temp_flower = flower_scene.instance()
    var flower_size = temp_flower.get_node("FlowerSprite/StaticBody2D/CollisionShape2D").shape.extents * 2
    var y = height - offset.y

    for i in flower_amount:
        var flower = flower_scene.instance()
        flower.index = i
        var x = i * flower_size.x + offset.y
        flower.position = Vector2(x, y)
        flowers.push_back(flower)
        get_node("Flowers").add_child(flower)

func _process(delta):
    points_label.text = str(points)
    for flower in flowers:
        if (flower.position.x > window_size.x - offset.x \
            || flower.position.x < offset.x):
            for f in flowers:
                f.change_direction()
