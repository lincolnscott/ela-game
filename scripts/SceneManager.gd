extends Node2D

@onready var center = $Camera2D.get_screen_center_position()







#var level = 0
#var level_scene = "res://levels/lvl_0.tscn"
#var current_level

const LevelLoader = preload("res://scripts/level_loader.gd")

# Define level data

@onready
var current_lvl = 1
@onready
var enemies_group = get_node("enemies")
# Called when the node enters theam scene tree for the first time.
func _ready():
	add_child(enemies_group)
	var player = get_node("Player")
	
	load_level(current_lvl, enemies_group)

func get_top_edge_center() -> Vector2:
	# Get the screen size
	var screen_size: Vector2 = get_viewport_rect().size

	# Calculate the center of the left edge of the screen
	var top_edge_center: Vector2 = Vector2(0, screen_size.x / 2)

	return top_edge_center




func load_level(level_num, enemies_group):
	var level_data_dict = LevelLoader.new().load_level(level_num)
	var level_data = level_data_dict["level"]
	var enemy_type = level_data_dict["enemy_type"]
	
	var pattern = level_data["pattern"]
	var enemy_spacing = Vector2(150,150)
	var start_position = Vector2()
	#var start_position = center
	
	
	for row_index in range(pattern.size()):
		var row = pattern[row_index]
		for col_index in range(row.length()):
			if row[col_index] == "#":
				spawn_enemy(Vector2(0,0) + Vector2(col_index * enemy_spacing.x, row_index * enemy_spacing.y), enemies_group, enemy_type)
				
	#TP TO CENTER
	var center_of_group = $enemies.find_center_of_group()
	
	enemies_group.position = Vector2(center.x, center.x - 400) - center_of_group

func delete_all_children(node):
	for child in node.get_children():
		child.queue_free()

func spawn_enemy(position, enemies_group, enemy_type):
	var enemy_scene = load(Global.EnemyPaths[enemy_type])
	var enemy_instance = enemy_scene.instantiate()
	enemy_instance.position = position
	enemies_group.add_child(enemy_instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(LevelLoader.new().load_level(2))
	if $enemies.goto_next_level == true:
		current_lvl += 1
		load_level(current_lvl, enemies_group)
	if Input.is_key_pressed(KEY_R):
		delete_all_children(enemies_group)
		current_lvl = 1
		load_level(current_lvl, enemies_group)
