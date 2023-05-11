extends Node2D

@export
var hp = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(body):
	hit(body)

func hit(body):
	hp -= 1
	body.queue_free()
	if hp < 1:
		queue_free()