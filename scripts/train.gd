extends Path2D

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

