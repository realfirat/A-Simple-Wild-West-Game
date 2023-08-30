extends CharacterBody2D

var speed = 500
var gun_anim_base
var front_gun
var back_gun
var gun_anim
var small_gun_ready
@onready var small_bullet = preload("res://scenes/bullet_rifle.tscn")
var head
var head_first_pos
var head_reverse_pos
var gun

func _ready():
	head = $spr_head
	head_first_pos = head.global_position
	small_gun_ready = true
	head_first_pos = $head_first_pos.position
	head_reverse_pos = $head_reverse_pos.position
	gun = $gun
	
func _process(delta):
	
	if Input.is_action_pressed("fire") and not global_variables.is_build_mode:
		if global_variables.dollar > 0 and small_gun_ready:
			var small_bullet_instance = small_bullet.instantiate()
			small_bullet_instance.global_position = global_position - Vector2(0, 4)
			get_parent().add_child(small_bullet_instance)
			small_gun_ready = false
			
	if get_global_mouse_position().x >= global_position.x:   # --------- FLIP SPRITES
		$spr_body.flip_h = false
		$spr_head.flip_h = false
		head.position = head_first_pos
		$spr_hat.flip_h = false
	if get_global_mouse_position().x < global_position.x:
		$spr_body.flip_h = true
		head.position = head_reverse_pos
		$spr_head.flip_h = true
		$spr_hat.flip_h = true
		
	if Input.is_action_just_pressed("build_mode"):
		if global_variables.is_build_mode:
			global_variables.is_build_mode = false
		else:
			global_variables.is_build_mode = true
			

func _physics_process(delta):         # ---------- PHYSICS PROCESS
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("go_right"):
		velocity.x += 1
	if Input.is_action_pressed("go_left"):
		velocity.x -= 1
	if Input.is_action_pressed("go_up"):
		velocity.y -= 1
	if Input.is_action_pressed("go_down"):
		velocity.y += 1
		
	velocity = velocity.normalized() * speed
	
	if not global_variables.is_build_mode:
		move_and_slide()

func _on_timer_small_gun_timeout():
	small_gun_ready = true


func _on_player_hitarea_area_entered(area):
	if area.is_in_group("bullet_rifle_fed"):
		global_variables.hp -= 5
		$spr_body.modulate = Color.PALE_VIOLET_RED
		$spr_hat.modulate = Color.PALE_VIOLET_RED
		$spr_head.modulate = Color.PALE_VIOLET_RED
		area.queue_free()		
		await get_tree().create_timer(0.1).timeout
		$spr_body.modulate = Color.WHITE
		$spr_hat.modulate = Color.WHITE
		$spr_head.modulate = Color.WHITE
		
	elif area.is_in_group("balta"):
		global_variables.hp -= 10
		$spr_body.modulate = Color.PALE_VIOLET_RED
		$spr_hat.modulate = Color.PALE_VIOLET_RED
		$spr_head.modulate = Color.PALE_VIOLET_RED
		area.queue_free()		
		await get_tree().create_timer(0.1).timeout
		$spr_body.modulate = Color.WHITE
		$spr_hat.modulate = Color.WHITE
		$spr_head.modulate = Color.WHITE
