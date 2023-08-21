extends Node2D

func _process(delta):
	$ProgressBar.value = global_variables.hp
