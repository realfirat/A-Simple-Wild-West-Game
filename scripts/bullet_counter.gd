extends Label

func _process(delta):
	text = "Small Bullet: " + str(global_variables.small_bullet) + "\nBig Bullet: " + str(global_variables.big_bullet)
