extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var Mandox = get_node("/root/Node2D/Player/BabyYoda").position.x
onready var Mandoy = get_node("/root/Node2D/Player/BabyYoda").position.y
onready var Stormtrooper = get_node("/root/Node2D/Node2D/Stormtrooper").position.x
var motion = Vector2(0, 0)
var UP = Vector2(0, -1)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _physics_process(delta):
	motion.y += 5
	var a = rand_range(0, 1000)
	if Input.is_action_pressed("ui_left"):
		Mandox = Mandox -1
	elif Input.is_action_pressed("ui_right"):
		Mandox = Mandox + 1
	if Mandox > (Stormtrooper + 50):
		motion.x = 30
		Stormtrooper = Stormtrooper + 0.57
	elif Mandox < (Stormtrooper - 50):
		motion.x = -30
		Stormtrooper = Stormtrooper - 0.57
	else:
		motion.x = 0
	
	if motion.x == -30:
		$AnimatedSprite.set_flip_h(true)
		$AnimatedSprite.position.x = -10
		$AnimatedSprite.play("Run")
			
	elif motion.x == 30:
		$AnimatedSprite.set_flip_h(false)
		$AnimatedSprite.position.x = 10	
		$AnimatedSprite.play("Run")
	else:	
		$AnimatedSprite.play("Idle")
	move_and_slide(motion, UP)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
