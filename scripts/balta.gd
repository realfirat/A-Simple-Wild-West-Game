extends Area2D

var aim_position
var bullet_speed = 15
var bullet_ready = true
var player

func _ready():
	if get_tree().has_group("player"):
		player = get_tree().get_first_node_in_group("player")
	aim_position = player.global_position - global_position
	aim_position = aim_position.normalized()
	
func _physics_process(delta):
		global_position += aim_position * bullet_speed
		rotation += 0.04

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
