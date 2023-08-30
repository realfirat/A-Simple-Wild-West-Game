extends Node2D

@onready var play_screen = preload("res://scenes/main.tscn")

func _on_button_pressed():
	get_tree().change_scene_to_packed(play_screen)

func _on_button_2_pressed():
	get_tree().quit()
