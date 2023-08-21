extends Area2D

@onready var sheriff = preload("res://scenes/sheriffoffice.tscn")
var is_ready_to_build

func _ready():
	is_ready_to_build = false

func _process(delta):
	global_position = Vector2(
		(int(get_global_mouse_position().x / 36) * 36),
		((int(get_global_mouse_position().y / 36) * 36) + 5)
		)
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and is_ready_to_build:
		if has_overlapping_bodies() == false and overlaps_area(get_parent().get_parent().get_node("build_zone")) == false:
			var b_sheriff = sheriff.instantiate()
			b_sheriff.global_position = global_position
			get_parent().add_child(b_sheriff)
			queue_free()
			
	if has_overlapping_bodies() == true or overlaps_area(get_parent().get_parent().get_node("build_zone")) == true:
		$Sprite2D.modulate = Color.RED
	else:
		$Sprite2D.modulate = Color.PALE_GREEN


func _on_timer_timeout():
	is_ready_to_build = true
