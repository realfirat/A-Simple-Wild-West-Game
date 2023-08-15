extends Control

func _draw():
	if global_variables.is_build_mode:
		var x = 0
		for n in 100:
			draw_rect(Rect2(0, 0 + x, 1920, 1), Color.GRAY, true, 1)
			x += 36
