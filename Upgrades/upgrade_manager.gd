extends Node2D
var UpgradeScenes = Global.UpgradeScenes

func _on_timer_timeout():
	# Random Upgrade
	var random_upgrade_path = UpgradeScenes[randi() % UpgradeScenes.size()]
	var random_upgrade_scene = load(random_upgrade_path)
	var random_upgrade_instance = random_upgrade_scene.instantiate()
	
	# Random Location 
	
	var viewport_rect = get_viewport_rect()
	var random_x = randf_range(viewport_rect.position.x, viewport_rect.position.x + viewport_rect.size.x)
	var random_y = randf_range(viewport_rect.position.y, viewport_rect.position.y + viewport_rect.size.y)
	var random_position = Vector2(random_x, random_y)
	
	# Spawn Upgrade
	random_upgrade_instance.position = random_position
	add_child(random_upgrade_instance)

@export var speed = 1.0
func _process(delta):
	for child in get_children():
		if not child is Timer:
			child.position.y += speed
			
