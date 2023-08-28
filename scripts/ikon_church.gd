extends Control

@onready var building_church = preload("res://scenes/b_church.tscn")

func _on_area_2d_mouse_entered():
	self.modulate = Color.TOMATO
	var tween = create_tween()
	tween.tween_property($church_price_tag, "position", Vector2(-403, -60), 0.2)


func _on_area_2d_mouse_exited():
	self.modulate = Color.WHITE
	var tween = create_tween()
	tween.tween_property($church_price_tag, "position", Vector2(-448, -17), 0.2)


func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and global_variables.is_a_building_selected == 0:
		if global_variables.dollar >= 200:
			global_variables.is_a_building_selected = 1
			var building = building_church.instantiate()
			$"../../../building_layer".add_child(building)

