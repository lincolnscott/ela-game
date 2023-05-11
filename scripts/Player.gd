extends Node2D

signal shoot(bullet, direction, location)
var Bullet = preload("res://bullet.tscn")
var fire_rate = 0.1  # Adjust this value to change the firing rate (in seconds)
var can_fire = true
var lerp_speed = 0.5
var angle = 15  # Controls the angle between streams in degrees
var streams = 3  # Number of streams

func _ready():
	pass

func _process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		var target_position = get_global_mouse_position()
		self.position = self.position.lerp(target_position, 0.5)
		
		if can_fire:
			var base_direction = Vector2.UP.rotated(self.rotation)
			for i in range(streams):
				# Calculate the angle offset for each stream
				var angle_offset = deg_to_rad(angle * (i - (streams - 1) / 2))
				# Rotate the base direction by the angle offset
				var stream_direction = base_direction.rotated(angle_offset)
				shoot.emit(Bullet, stream_direction, global_position)
			can_fire = false
			$Timer.start()

func _on_shoot(bullet, direction, location):
	var bullet_instance = Bullet.instantiate()
	bullet_instance.global_position = location
	bullet_instance.rotation = direction.x
	#bullet_instance.set_direction(direction)  # Set the bullet's direction
	get_parent().add_child(bullet_instance)

#func _on_Timer_timeout():
	


func _on_timer_timeout():
	can_fire = true
