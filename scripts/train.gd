extends Path2D

var is_tourist_entered = false

func _ready():
	$PathFollow2D/train/tren/AnimationPlayer.play("teker_ayrac")

func _process(delta):
	$PathFollow2D/train/tren/teker.rotation += 0.06
	$PathFollow2D/train/tren/teker2.rotation += 0.06
	$PathFollow2D/train/tren/teker3.rotation += 0.06
	$tourist_wagon/train/tren/teker.rotation += 0.06
	$tourist_wagon/train/tren/teker2.rotation += 0.06
	$bandit_wagon/train/tren/teker.rotation += 0.06
	$bandit_wagon/train/tren/teker2.rotation += 0.06
	
	if not global_variables.is_build_mode:
		$PathFollow2D.progress_ratio += 0.0002
		$tourist_wagon.progress_ratio += 0.0002
		$bandit_wagon.progress_ratio += 0.0002


func _on_visible_on_screen_notifier_2d_screen_entered():
	is_tourist_entered = true

func _on_visible_on_screen_notifier_2d_screen_exited():
	is_tourist_entered = false


func _on_timer_timeout():
	if is_tourist_entered:
		$tourist_wagon/money_particle.emitting = true
		global_variables.dollar += 20 + (global_variables.fun / 50)
