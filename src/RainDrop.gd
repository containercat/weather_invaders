extends KinematicBody2D

var velocity = Vector2()
var speed = 400

func _physics_process(delta):
    velocity.y = speed * delta

    var collision = move_and_collide(velocity)

    if collision:
        var flower = collision.get_collider()
        flower.grow()
        get_parent().remove_child(self)

