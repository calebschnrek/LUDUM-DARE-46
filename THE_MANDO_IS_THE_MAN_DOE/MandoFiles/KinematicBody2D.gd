extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var timer = Timer.new()
var motion = Vector2()
var UP = Vector2(0, -1)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
var Z = false
var X = false
var space = false
var L = false
var R = false
var spriteFinishIdle = false
var spriteFinishRun = false
var spriteFinishJump = false

func _physics_process(delta):
	motion.y += 5
	if Input.is_action_pressed("Space"):
		space = true
	else:
		space = false
	if Input.is_action_pressed("flame"):
		Z = true
	else:
		Z = false
	if Input.is_action_pressed("shoot"):
		X = true
	else:
		X = false
	if Input.is_action_pressed("ui_left"):
		L = true
	else:
		L = false
	if Input.is_action_pressed("ui_right"):
		R = true
	else:
		R = false
	
	
	if L == true and R == false:
		motion.x = -50
		$AnimatedSprite.set_flip_h(true)
		$AnimatedSprite.position.x = -20
	if L == false and R == true:
		motion.x = 50
		$AnimatedSprite.set_flip_h(false)
		$AnimatedSprite.position.x = 20
	if is_on_floor() and space == true:
		motion.y = -200
	if (L == true and R == true) or (L == false and R == false):
		motion.x = 0
		
		
	var Idle = false
	var Run	= false
	var Jump = false
	var Shoot = false
	var Flame = false
	
	
	if motion.x == 0 and is_on_floor():
		Idle = true
	else:
		Idle = false
	if motion.x != 0 and is_on_floor():
		Run = true
	else: 
		Run = false
	if not is_on_floor():
		Jump = true
	else:
		Jump = false
		
	if Z == true and X == false:
		Flame = true
	else:
		Flame = false
	if Z == false and X == true:
		Shoot = true
	else:
		Shoot = false
	
		
	if Idle == true and Flame == false and Shoot == false:
		$AnimatedSprite.play("Idle")
	if Idle == true and Flame == true:
		$AnimatedSprite.play("IdleFlamethrower")
	if Idle == true and Shoot == true:
		$AnimatedSprite.play("IdleGunFire")
		
	if Run == true and Flame == false and Shoot == false:
		$AnimatedSprite.play("Run")
	if Run == true and Flame == true:
		$AnimatedSprite.play("RunFlamethrower")
	if Run == true and Shoot == true:
		$AnimatedSprite.play("RunGunFire")
		
	if Jump == true and Flame == false and Shoot == false:
		$AnimatedSprite.play("Jump")
	if Jump == true and Flame == true:
		$AnimatedSprite.play("JumpFlamethrower")
	if Jump == true and Shoot == true:
		$AnimatedSprite.play("JumpGunFire")

	
	move_and_slide(motion, UP)
	pass

func _on_AnimatedSprite_animation_finished():
	var Shoot = false
	var DoneShooting = false
	if Shoot == true:
		DoneShooting == true
		print("Done")
	else:
		DoneShooting == false
	pass # Replace with function body.
