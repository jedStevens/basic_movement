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

var direction = Vector2()

# This is the maximum speed this should be as fast
# We will limit the velocity and then stretch it to this length
export(float) var max_speed = 100.0
export(float) var max_steer = 100.0

func _ready():
	print("The Pointing Hand")

func _physics_process(delta):
	# This is the intended movement based on the users input
	var to_move = get_input_as_move()
	
	var target_velocity = to_move * (max_speed if to_move.length() > 0 else 0)
	
	# Steering is what we need to add to velocity to 
	# turn it fully to the desired direction
	var steering = target_velocity - velocity
	
	#maybe we want to steer too far for this 
	# character's ability so we clamp it
	steering = steering.clamped(max_steer)
	
	# We add the new clamped steering line to 
	velocity = velocity + steering * delta
	velocity = velocity.clamped(max_speed)
	
	direction = velocity.normalized()
	rotation = direction.angle()
	
	move_and_slide(velocity)
	
func get_input_as_move():
	var to_move = Vector2()
	#################################
	if Input.is_key_pressed(KEY_UP):
		to_move.y -= 1
	if Input.is_key_pressed(KEY_DOWN):
		to_move.y += 1

	# LEFT / RIGHT
	if Input.is_key_pressed(KEY_LEFT):
		to_move.x -= 1
	if Input.is_key_pressed(KEY_RIGHT):
		to_move.x += 1
	#################################
	return to_move