extends Label

func score_changed():
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1.4, 1.4), 0.2)
	tween.tween_property(self, "scale", Vector2(1, 1), 0.2)
