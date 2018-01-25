extends KinematicBody2D

# This is a comment!
# The computer ignores this!
# Hey COMPUTER! YOU STINK!! See it doesn't care

# How is this object moving?
# We need a Vector (2 Numbers) to show its X and Y movement
# every second we will move along a grid by these values,
# X for left and right
# Y for up and down
var velocity = Vector2()

# This is the maximum speed this should be as fast
# We will limit the velocity and then stretch it to this length
export(float) var max_speed = 100.0


func _ready():
	print("The Sliding Sneezer")

func _physics_process(delta):
	# This is the intended movement based on the users input
	var to_move = Vector2()
	
	# This section could be its own function
	#################################
	# UP / DOWN
	if Input.is_key_pressed(KEY_W):
		to_move.y -= 1
	if Input.is_key_pressed(KEY_S):
		to_move.y += 1
	
	# LEFT / RIGHT
	if Input.is_key_pressed(KEY_A):
		to_move.x -= 1
	if Input.is_key_pressed(KEY_D):
		to_move.x += 1
	#################################
	
	velocity = to_move * max_speed
	
	move_and_slide(velocity)

func get_input_as_move():
	var to_move = Vector2()
	#################################
	# Guess what goes here.
	#################################
	return to_move