extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("escape"):
		get_tree().quit()
	
	if Input.is_action_just_pressed("build_mode"):
		if $UI/building_grid.visible:
			$UI/building_grid.visible = false
		else:
			$UI/building_grid.visible = true
