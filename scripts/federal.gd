extends Path2D

var fed_speed = 0.0015
@onready var fed_bullet = preload("res://scenes/bullet_rifle_fed.tscn")
@onready var hp = global_variables.fed_max_hp + (global_variables.independence / 50)
@onready var fed_dead = preload("res://scenes/fed_dead.tscn")

func _ready():
	$PathFollow2D/federal_body/hp_bar.max_value = hp

func _physics_process(delta):
	if not global_variables.is_build_mode:
		$PathFollow2D.progress_ratio += fed_speed

	if $PathFollow2D.progress_ratio > 0.99:
		queue_free()
		
	$PathFollow2D/federal_body/hp_bar.value = hp
	
	if hp <= 0:
		global_variables.score += 10
		global_variables.independence += 10
		global_variables.dollar += 20
		var score_text = get_tree().get_first_node_in_group("score_text")
		var independence_text = get_tree().get_first_node_in_group("independence_text")
		score_text.score_changed()
		independence_text.score_changed()
		var dead_scene = fed_dead.instantiate()
		dead_scene.global_position = $PathFollow2D/federal_body/Sprite2D.global_position
		get_parent().add_child(dead_scene)
		queue_free()
	
func _on_timer_timeout():
	if not global_variables.is_build_mode:
		var ready_fed_bullet = fed_bullet.instantiate()
		ready_fed_bullet.global_position = $PathFollow2D/federal_body/Sprite2D.global_position
		add_child(ready_fed_bullet)


func _on_federal_hitarea_area_entered(area):
	if area.is_in_group("bullet_rifle"):
		$PathFollow2D/federal_body/Sprite2D.modulate = Color.PALE_VIOLET_RED
		$PathFollow2D/federal_body/blood_particle.emitting = true
		$PathFollow2D.progress_ratio -= 0.002
		hp -= 5
		area.queue_free()
		await get_tree().create_timer(0.2).timeout
		$PathFollow2D/federal_body/Sprite2D.modulate = Color.WHITE
