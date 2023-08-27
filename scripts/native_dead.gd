extends Node2D

var player

func _ready():
	if get_tree().has_group("player"):
		player = get_tree().get_first_node_in_group("player")
		
	if global_position.x <= player.global_position.x:
		$Sprite2D.flip_h = false
	else:
		$Sprite2D.flip_h = true
		
	$particle_faith.emitting = true

func _process(delta):
	var tween = create_tween()
	tween.tween_property($Sprite2D, "modulate", Color(1, 1, 1, 0), 1)

func _on_timer_timeout():
	queue_free()
