extends StaticBody2D

@onready var saloon = preload("res://scenes/saloon.tscn")

func _process(delta):
	global_position = Vector2(
		(int(get_global_mouse_position().x / 36) * 36),
		((int(get_global_mouse_position().y / 36) * 36) + 5)
		)
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		await(0.5)
		var b_saloon = saloon.instantiate()
		b_saloon.global_position = global_position
		get_parent().add_child(b_saloon)
		queue_free()
