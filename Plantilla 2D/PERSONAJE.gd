extends KinematicBody2D

const moveSpeed = 25
const maxSpeed= 50

const jumpHeight = -300
const up = Vector2(0,-1)
const gravity = 15

onready var sprite = $Sprite
onready var animationPlayer = $AnimationPlayer

var motion = Vector2()



	motion.y += gravity
	var friction = false
	
	if Input.is_action_pressed ("ui_right"):
		Sprite.flip_h = false
		animationPlayer.play("iddle")
		motion.x = max (motion.x+moveSpeed,maxSpeed)
	
	elif Input.is_action_pressed ("ui_left"):
		Sprite.flip_h = true
		animationPlayer.play("iddle")
		motion.x = max (motion.x-moveSpeed,-maxSpeed)
	
	else: 
		animationPlayer.play("iddle")
		friction = true
		
	if is_on_floor():
		if Input.is_action_pressed("ui_accept"):
			motion.y = jumpHeight
		if friction == true:
				motion.x = lerp(motion.x ,0,0.5)
	
	else:
		if friction==true:
			motion.x = lerp(motion.x ,0,.01)
			
	motion = move_and_slide(motion,up)
