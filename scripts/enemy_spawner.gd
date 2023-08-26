extends Node2D

@onready var fed = preload("res://scenes/federal.tscn")
@onready var native = preload("res://scenes/native.tscn")
@onready var bandit = preload("res://scenes/bandit.tscn")
@onready var fed_reverse = preload("res://scenes/federal_reverse.tscn")
@onready var native_reverse = preload("res://scenes/native_reverse.tscn")
@onready var bandit_reverse = preload("res://scenes/bandit_reverse.tscn")
@onready var enemies = [fed, native, bandit, native_reverse, bandit_reverse, fed_reverse]


func _physics_process(delta):
	$Timer.wait_time = global_variables.fed_spawner_time
	
func _on_timer_timeout():
	var new_enemy_scene = enemies.pick_random()
	var new_enemy = new_enemy_scene.instantiate()
	get_parent().add_child(new_enemy)
