extends Node2D

@onready var ready_to_change_cursor = true
var aim = load("res://assets/_0000_aim.png")
var hammer = load("res://assets/hammer.png")

func _ready():
	Input.set_custom_mouse_cursor(aim)

func _process(delta):
	if Input.is_action_just_pressed("escape"):
		get_tree().quit()
	
	if Input.is_action_just_pressed("build_mode"):
		if $UI/building_grid.visible:
			$UI/building_grid.visible = false
			if ready_to_change_cursor:
				Input.set_custom_mouse_cursor(aim)
				ready_to_change_cursor = false
		else:
			$UI/building_grid.visible = true
			if ready_to_change_cursor:
				Input.set_custom_mouse_cursor(hammer)
				ready_to_change_cursor = false
	
	ready_to_change_cursor = true
		
	
