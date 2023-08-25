extends Area2D

var aim_position
var bullet_speed = 20
var bullet_ready = true
var player

func _ready():
	player = get_tree().get_first_node_in_group("player")
	aim_position = player.global_position - global_position
	aim_position = aim_position.normalized()
	look_at(player.global_position)
	$shoot_particle.emitting = true
	
func _physics_process(delta):
	if not global_variables.is_build_mode:
		global_position += aim_position * bullet_speed

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
