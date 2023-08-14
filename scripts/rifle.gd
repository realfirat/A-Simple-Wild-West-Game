extends Node2D

var rifle

func _ready():
	rifle = $spr_rifle
	
func _process(delta):
	if get_global_mouse_position().x >= global_position.x:
		rifle.flip_v = false
		rifle.global_position = $right_pos_marker.global_position
	else:
		rifle.flip_v = true
		rifle.global_position = $left_pos_marker.global_position
		
	look_at(get_global_mouse_position())
