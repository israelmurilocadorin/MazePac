extends KinematicBody2D
const UP =  Vector2(0, -1)
const GRAVITY = 20
const SPEED = 200
const JUMP = -500

var motion = Vector2()

func _physics_process(delta):
	motion.y  += GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
	else:
		motion.x = 0
		
	if is_on_floor():
		print("Esta no chao")
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP
	else:
		if Input.is_action_just_pressed("ui_up"):
			if motion.y > 0:
				motion.y += JUMP
	
	motion = move_and_slide(motion,UP)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
