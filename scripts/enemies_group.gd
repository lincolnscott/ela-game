extends Node

#CENTERS ENEMIES


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var goto_next_level
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_child_count() == 0:
		goto_next_level = true
	else:
		goto_next_level = false


func find_center_of_group():
	var total_position_x = 0
	var min_position_y = INF
	var num_children = get_child_count()

	for child in get_children():
		total_position_x += child.position.x
		min_position_y = min(min_position_y, child.position.y)

	var middle_top_position = Vector2(total_position_x / num_children, min_position_y)

	#print(typeof(middle_top_position))
	return middle_top_position

