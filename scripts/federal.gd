extends Path2D

var fed_speed = 0.0015
@onready var fed_bullet = preload("res://scenes/bullet_rifle_fed.tscn")
var hp = 40


func _physics_process(delta):
	if not global_variables.is_build_mode:
		$PathFollow2D.progress_ratio += fed_speed

	if $PathFollow2D.progress_ratio > 0.99:
		queue_free()
		
	$PathFollow2D/federal_body/hp_bar.value = hp
	
	if hp <= 0:
		global_variables.score += 10
		queue_free()
	
func _on_timer_timeout():
	if not global_variables.is_build_mode:
		var ready_fed_bullet = fed_bullet.instantiate()
		ready_fed_bullet.global_position = $PathFollow2D/federal_body/Sprite2D.global_position
		add_child(ready_fed_bullet)


func _on_federal_hitarea_area_entered(area):
	if area.is_in_group("bullet_rifle"):
		hp -= 5
		area.queue_free()
