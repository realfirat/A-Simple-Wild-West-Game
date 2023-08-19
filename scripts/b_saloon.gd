extends StaticBody2D

@onready var saloon = preload("res://scenes/buildings/saloon.tscn")
var is_ready_to_build

func _ready():
	is_ready_to_build = false

func _process(delta):
	global_position = Vector2(
		(int(get_global_mouse_position().x / 36) * 36),
		((int(get_global_mouse_position().y / 36) * 36) + 5)
		)
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and is_ready_to_build:
		var b_saloon = saloon.instantiate()
		b_saloon.global_position = global_position
		get_parent().add_child(b_saloon)
		queue_free()

func _on_timer_timeout():
	is_ready_to_build = true
