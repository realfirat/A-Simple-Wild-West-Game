extends CharacterBody2D

var player : CharacterBody2D

func _ready():
	if get_tree().has_group("player"):
		player = get_tree().get_first_node_in_group("player")
		
func _process(delta):
	if global_position.x <= player.global_position.x:
		$Sprite2D.flip_h = false
	else:
		$Sprite2D.flip_h = true

