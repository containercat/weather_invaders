extends StaticBody2D

enum { POT, SAPLING, LEAVES, BLOSSOMED }

var pot_texture = preload("res://assets/pot.png")
var sapling_texture = preload("res://assets/sapling.png")
var leaves_texture = preload("res://assets/leaves.png")
var blossomed_texture = preload("res://assets/grown.png")

var sapling_texture_decayed = preload("res://assets/sapling-decayed.png")
var leaves_texture_decayed = preload("res://assets/leaves-decayed.png")
var grown_texture_decayed = preload("res://assets/grown-decayed.png")


var water_texture_1 = preload("res://assets/water1.png")
var water_texture_2 = preload("res://assets/water2.png")
var water_texture_3 = preload("res://assets/water3.png")

var status
var sprite
var game_controller

var decayed = false

var decay_time = 5

var water_level = 0
var decay_timer

var counter

var timer
var ms_timer

export var plant_timer = 1.5

var ms_wait_time = 0.01

var current_time

var water

func _ready():
    scale /= 2

    # get nodes
    sprite = get_node("Sprite")
    counter = get_node("Counter")
    water = get_node("Water")
    
    water.texture = null
    current_time = plant_timer

    timer = Timer.new()
    add_child(timer)
    
    timer.connect("timeout", self, "on_Timer_timeout")
    timer.set_wait_time(plant_timer)
    timer.set_one_shot(true)
    
    decay_timer = Timer.new()
    add_child(decay_timer)
    
    decay_timer.connect("timeout", self, "on_DecayTimer_timeout")
    decay_timer.set_wait_time(decay_time)
    decay_timer.set_one_shot(true)

    #ms_timer = Timer.new();
    #add_child(ms_timer)

    #ms_timer.connect("timeout", self, "on_MSTimer_timeout")
    #ms_timer.set_wait_time(ms_wait_time)
    #ms_timer.set_one_shot(false)


    game_controller = get_parent().get_parent()
    status = POT

func add_water():
    print("status: " + str(status) + " " + "decayed: " + str(decay_timer.time_left) + "decayedstatus: " + str(decayed))
    if decayed:
        return

    if timer.is_stopped():
        decay_timer.stop()
        timer.start()
        grow()

func on_DecayTimer_timeout():
    decay()


func on_Timer_timeout():
    decay_timer.start()
    print("decay start")
    

func decay():
    #status = POT
    decayed = true

    match status:
        SAPLING:
            sprite.texture = sapling_texture_decayed
        LEAVES:
            sprite.texture = leaves_texture_decayed
        BLOSSOMED:
            sprite.texture = grown_texture_decayed


func grow():
    match status:
        POT:
            sprite.texture = sapling_texture
            status = SAPLING
            game_controller.points += 1
        SAPLING:
            sprite.texture = leaves_texture
            status = LEAVES
            game_controller.points += 2
        LEAVES:
            sprite.texture = blossomed_texture
            status = BLOSSOMED
            game_controller.points += 4
        BLOSSOMED:
            pass
