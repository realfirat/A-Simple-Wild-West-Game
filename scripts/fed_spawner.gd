extends Node2D

@export var fed : PackedScene

func _physics_process(delta):
	$Timer.wait_time = global_variables.fed_spawner_time
	
func _on_timer_timeout():
	var new_fed = fed.instantiate()
	get_parent().add_child(new_fed)
