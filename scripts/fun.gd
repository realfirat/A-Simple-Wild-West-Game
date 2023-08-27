extends Label


func score_changed():
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1.6, 1.6), 0.1)
	tween.tween_property(self, "scale", Vector2(1, 1), 0.1)
