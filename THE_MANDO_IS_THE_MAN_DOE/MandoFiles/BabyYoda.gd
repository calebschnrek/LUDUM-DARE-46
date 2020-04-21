extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var mando = get_node("/root/Node2D/Player/Mando").position.x
onready var yoda = get_node("/root/Node2D/Player/BabyYoda").position.x
var motion = Vector2()
var speed = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.
func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		mando = mando - 1
	elif Input.is_action_pressed("ui_right"):
		mando = mando + 1
	print(mando)
	if mando > (yoda + 1):
		motion.x = 20
		yoda = yoda + 0.38
		
	elif mando < (yoda - 1):
		motion.x = -20 
		yoda = yoda - 0.38
	else:
		motion.x = 0
	if motion.x == 0:
		$AnimatedSprite.play("Middle")
		
	if motion.x == -20 and ((yoda - mando) > 30):
		$AnimatedSprite.play("PointingRight")
	elif motion.x == -20 and ((yoda - mando) > 15):
		$AnimatedSprite.play("MostlyRight")
	elif motion.x == -20 and ((yoda - mando) > 0):
		$AnimatedSprite.play("KindaRight")
		
	elif motion.x == 20 and ((mando - yoda) > 30):
		$AnimatedSprite.play("PointingLeft")
	elif motion.x == 20 and ((mando - yoda) > 15):
		$AnimatedSprite.play("MostlyLeft")
	elif motion.x == 20 and ((mando) > 0):
		$AnimatedSprite.play("KindaLeft")
	else:
		$AnimatedSprite.play("Middle")
		
	print(yoda)
	
	move_and_slide(motion)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
