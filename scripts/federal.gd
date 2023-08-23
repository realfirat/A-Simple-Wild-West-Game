extends Path2D

var fed_speed = 0.001

func _process(delta):
	$PathFollow2D.progress_ratio += fed_speed

	if $PathFollow2D.progress_ratio > 0.99:
		queue_free()
