extends Node2D

@onready var anim_ready = true

func _process(delta):
	if global_variables.is_build_mode and anim_ready:
		move_up()
		anim_ready = false
	elif not global_variables.is_build_mode and anim_ready:
		move_down()
		anim_ready = false
	await(1)
	anim_ready = true
	
func move_up():
	var tween = create_tween()
	tween.tween_property(self, "position", Vector2(0, -10), 0.5)

func move_down():
	var tween = create_tween()
	tween.tween_property(self, "position", Vector2(0, 200), 0.5)
