extends CharacterBody2D

@onready var nav : NavigationAgent2D = $NavigationAgent2D
var speed = 200
var accel = 7
var player

func _ready():
	if get_tree().has_group("player"):
		player = get_tree().get_nodes_in_group("player")[0]

		
func _physics_process(delta):
	var direction = Vector3()
	nav.target_position = player.global_position
	
	direction = nav.get_next_path_position() - global_position
	direction = direction.normalized()
	
	velocity = velocity.lerp(direction * speed, accel * delta)
	move_and_slide()
