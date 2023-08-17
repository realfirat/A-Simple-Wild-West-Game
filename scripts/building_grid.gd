extends Control

func _draw():
		var y = 0
		for n in 1080/36:
			draw_line(Vector2(0, 0 + y), Vector2(1920, 0 + y), Color8(255, 255, 255, 255/8), 1, true)
			y += 36
		
		var x = 0
		for n in 1920/36:
			draw_line(Vector2(0 + x, 0), Vector2(0 + x, 1920), Color8(255, 255, 255, 255/8), 1, true)
			x += 36

		
