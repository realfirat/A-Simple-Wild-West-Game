extends CharacterBody2D

var player : CharacterBody2D
@onready var fed_bullet = preload("res://scenes/bullet_rifle_fed.tscn")
var in_screen

func _ready():
	if get_tree().has_group("player"):
		player = get_tree().get_first_node_in_group("player")
		
func _process(delta):
	if global_position.x <= player.global_position.x:
		$rifle.flip_v = false
	else:
		$rifle.flip_v = true
 
	$rifle.look_at(player.global_position)

func _on_timer_timeout():
	if not global_variables.is_build_mode and in_screen:
		var ready_fed_bullet = fed_bullet.instantiate()
		ready_fed_bullet.global_position = get_parent().get_parent().global_position
		add_child(ready_fed_bullet)


func _on_visible_on_screen_notifier_2d_screen_entered():
	in_screen = true


func _on_visible_on_screen_notifier_2d_screen_exited():
	in_screen = false
