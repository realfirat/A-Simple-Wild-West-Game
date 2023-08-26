extends Area2D

var aim_position
var bullet_speed = 60
var bullet_ready = true
var player

func _ready():
	aim_position = get_global_mouse_position() - global_position
	aim_position = aim_position.normalized()
	look_at(get_global_mouse_position())
	$shoot_particle.emitting = true
	global_variables.bullet -= 1
	
func _physics_process(delta):
		global_position += aim_position * bullet_speed

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
