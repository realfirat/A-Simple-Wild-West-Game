extends Label

func _process(delta):
	text = "Bullet: " + str(global_variables.bullet) + "\nBuilding Mode: " + str(global_variables.is_build_mode)
