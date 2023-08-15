extends CharacterBody2D

var speed = 500
var gun_anim_base
var front_gun
var back_gun
var gun_anim
var small_gun_ready
var rifle_ready
@onready var small_bullet = preload("res://scenes/bullet_small.tscn")
@onready var big_bullet = preload("res://scenes/bullet_rifle.tscn")
var head
var head_first_pos
var head_reverse_pos
var gun
var rifle


func _ready():
	head = $spr_head
	head_first_pos = head.global_position
	small_gun_ready = true
	rifle_ready = true
	head_first_pos = $head_first_pos.position
	head_reverse_pos = $head_reverse_pos.position
	gun = $gun
	rifle = $rifle
	
func _process(delta):
	
	if Input.is_action_just_pressed("change_weapon"):
		if gun.visible:
			gun.visible = false
			rifle.visible = true
		elif rifle.visible:
			gun.visible = true
			rifle.visible = false # GITHUB TEST AGAIN FROM WORK
	
	if gun.visible:                              # ------------ FIRE MECHANISM
		if Input.is_action_pressed("fire"):
			if global_variables.small_bullet > 0 and small_gun_ready:
				var small_bullet_instance = small_bullet.instantiate()
				small_bullet_instance.global_position = global_position
				get_parent().add_child(small_bullet_instance)
				small_gun_ready = false
	if rifle.visible:
		if Input.is_action_pressed("fire"):
			if global_variables.big_bullet > 0 and rifle_ready:
				var big_bullet_instance = big_bullet.instantiate()
				big_bullet_instance.global_position = $rifle_bullet_pos.global_position
				get_parent().add_child(big_bullet_instance)
				rifle_ready = false
			
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
	
	move_and_slide()
	

func _on_timer_small_gun_timeout():
	small_gun_ready = true

func _on_timer_rifle_timeout():
	rifle_ready = true
