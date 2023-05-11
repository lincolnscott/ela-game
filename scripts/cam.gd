extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_down"):
		self.zoom -= Vector2(.1,.1)
	elif Input.is_action_just_pressed("ui_up"):
		self.zoom += Vector2(.1,.1)
	position.y -= 500 * delta
