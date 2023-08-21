extends Control

@onready var building_sheriff = preload("res://scenes/b_sheriffoffice.tscn")

func _on_area_2d_mouse_entered():
	self.modulate = Color.TOMATO


func _on_area_2d_mouse_exited():
	self.modulate = Color.WHITE


func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and global_variables.is_a_building_selected == 0:
		global_variables.is_a_building_selected = 1
		var building = building_sheriff.instantiate()
		$"../../../building_layer".add_child(building)
