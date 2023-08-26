extends Path2D

var fed_speed = -0.0025
@onready var balta = preload("res://scenes/balta.tscn")
var hp = 30

func _physics_process(delta):
	if not global_variables.is_build_mode:
		$PathFollow2D.progress_ratio += fed_speed

	if $PathFollow2D.progress_ratio < 0.01:
		queue_free()
		
	$PathFollow2D/native_body/hp_bar.value = hp
	
	if hp <= 0:
		queue_free()
	
func _on_timer_timeout():
	if not global_variables.is_build_mode:
		var ready_balta = balta.instantiate()
		ready_balta.global_position = $PathFollow2D/native_body/Sprite2D.global_position
		add_child(ready_balta)

func _on_native_hitarea_area_entered(area):
	if area.is_in_group("bullet_rifle"):
		hp -= 5
		area.queue_free()
