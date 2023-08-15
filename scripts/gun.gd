extends Node2D

var front_gun
var back_gun
var shoot_particle
var front_gun_first_pos
var back_gun_first_pos
var front_gun_reverse_marker
var back_gun_reverse_marker
var gun_first_pos

func _ready():
	front_gun = $spr_front_gun
	back_gun = $spr_back_gun
	shoot_particle = $shoot_particle
	front_gun_reverse_marker = $front_gun_reverse_pos
	back_gun_reverse_marker = $back_gun_reverse_pos
	front_gun_first_pos = front_gun.position
	back_gun_first_pos = back_gun.position
	gun_first_pos = position
	
func _process(delta):
	if get_global_mouse_position().x >= global_position.x:       # GUNS SPRITES FLIP
		front_gun.position = front_gun_first_pos
		back_gun.position = back_gun_first_pos
		front_gun.flip_v = false
		back_gun.flip_v = false
	else:
		front_gun.position = front_gun_reverse_marker.position
		back_gun.position = back_gun_reverse_marker.position
		front_gun.flip_v = true
		back_gun.flip_v = true
		
func _input(event):
	if event is InputEventMouseButton:
		var tween = create_tween()
		if get_global_mouse_position().x >= global_position.x:  
			tween.tween_property(self, "position", position + Vector2(-5, 0), 0.05).from(position)
			tween.tween_property(self, "position", position + Vector2(0, 0), 0.05).from(position)
		else:
			tween.tween_property(self, "position", position + Vector2(5, 0), 0.05).from(position)
			tween.tween_property(self, "position", position + Vector2(0, 0), 0.05).from(position)
			
		
	look_at(get_global_mouse_position())           # ROTATE TO THE MOUSE POS
