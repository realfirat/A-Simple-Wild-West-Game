extends Area2D

var aim_position
var bullet_speed = 20
var bullet_ready = true

func _ready():
	aim_position = get_global_mouse_position() - global_position
	aim_position = aim_position.normalized()
	global_variables.bullet -= 1
	look_at(get_global_mouse_position())
	$shoot_particle.emitting = true
	
func _physics_process(delta):
		global_position += aim_position * bullet_speed


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
