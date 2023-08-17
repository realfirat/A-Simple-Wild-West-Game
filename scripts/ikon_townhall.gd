extends Control

@onready var building_townhall = preload("res://scenes/b_townhall.tscn")

func _on_area_2d_mouse_entered():
	self.modulate = Color.TOMATO


func _on_area_2d_mouse_exited():
	self.modulate = Color.WHITE


func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		var building = building_townhall.instantiate()
		$"../../../building_layer".add_child(building)
