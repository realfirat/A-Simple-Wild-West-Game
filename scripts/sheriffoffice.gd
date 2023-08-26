extends StaticBody2D

func _ready():
	$smoke.emitting = true
	$smoke2.emitting = true
	global_variables.is_a_building_selected = 0


func _on_area_2d_area_entered(area):
	if area.is_in_group("balta") or area.is_in_group("bullet_rifle_fed") or area.is_in_group("bullet_rifle"):
		area.queue_free()
