extends StaticBody2D

func _ready():
	$smoke.emitting = true
	$smoke2.emitting = true
	global_variables.is_a_building_selected = 0
