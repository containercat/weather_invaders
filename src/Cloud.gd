extends Sprite

var speed = 4
var velocity = Vector2()

var rain_drop_scene = preload("res://scenes/RainDrop.tscn")

func _ready():
    pass

func movement():
    velocity = Vector2()

    if Input.is_action_pressed("move_right"):
        velocity.x += 1
    if Input.is_action_pressed("move_left"):
        velocity.x -= 1

    velocity = velocity.normalized() * speed

    translate(velocity)

func spawn_rain():
    var rain_drop = rain_drop_scene.instance()
    rain_drop.position = position
    get_node("../").add_child(rain_drop)

func rain_drops():
    if Input.is_action_just_pressed("spawn_rain_drop"):
        spawn_rain()

func _physics_process(delta):
    movement()
    rain_drops()