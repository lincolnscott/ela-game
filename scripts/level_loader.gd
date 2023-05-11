extends Node
func load_level(level_number):
	var path = "res://Levels/level" + str(level_number) + ".gd"
	var script = load(path)
	var ScriptInstance = script.new()
	var enemy_type = ScriptInstance.enemy_type
	var level = ScriptInstance.level
	return {
		"level": level,
		"enemy_type": enemy_type
	}
	
#func load():
#	var file = FileAccess.open("user://save_game.dat", FileAccess.READ)
#	var content = file.get_as_text()
#	return content

