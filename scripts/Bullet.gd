extends Area2D

var velocity = 1000

func _process(delta):
	# Create a vector pointing upwards
	var movement = Vector2(0, -1)
	
	# Rotate the movement vector according to the node's rotation
	movement = movement.rotated(rotation)
	
	# Scale the movement vector by the velocity
	movement *= velocity
	
	# Update the global_position using the movement vector and delta time
	global_position += movement * delta
