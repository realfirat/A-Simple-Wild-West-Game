extends Path2D

var fed_speed = 0.0025
@onready var balta = preload("res://scenes/balta.tscn")
var hp = 30

func _physics_process(delta):
	if not global_variables.is_build_mode:
		$PathFollow2D.progress_ratio += fed_speed

	if $PathFollow2D.progress_ratio > 0.99:
		queue_free()
		
	$PathFollow2D/native_body/hp_bar.value = hp
	
	if hp <= 0:
		global_variables.score += 15
		global_variables.faith += 10
		var score_text = get_tree().get_first_node_in_group("score_text")
		var faith_text = get_tree().get_first_node_in_group("faith_text")
		score_text.score_changed()
		faith_text.score_changed()
		queue_free()
	
func _on_timer_timeout():
	if not global_variables.is_build_mode:
		var ready_balta = balta.instantiate()
		ready_balta.global_position = $PathFollow2D/native_body/Sprite2D.global_position
		add_child(ready_balta)

func _on_native_hitarea_area_entered(area):
	if area.is_in_group("bullet_rifle"):
		$PathFollow2D/native_body/Sprite2D.modulate = Color.PALE_VIOLET_RED
		$PathFollow2D/native_body/blood_particle.emitting = true
		$PathFollow2D.progress_ratio -= 0.002
		hp -= 5
		area.queue_free()
		await get_tree().create_timer(0.2).timeout
		$PathFollow2D/native_body/Sprite2D.modulate = Color.WHITE
