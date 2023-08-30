extends Node2D

@onready var play_scene = preload("res://scenes/main.tscn")

func _on_button_pressed():
	global_variables.score = 0
	global_variables.dollar = 100
	global_variables.fun = 0
	global_variables.faith = 0
	global_variables.justice = 0
	global_variables.independence = 0
	global_variables.native_max_hp = 30
	global_variables.bandit_max_hp = 20
	global_variables.fed_spawner_time = 2
	global_variables.hp = 100
	get_tree().change_scene_to_packed(play_scene)

func _ready():
	$Label.text = str(global_variables.score)

func _on_button_2_pressed():
	get_tree().quit()
