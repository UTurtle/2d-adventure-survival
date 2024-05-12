extends CharacterBody2D

@export var speed = 100
@export var dash_speed = 400
@export var dash_length = 0.05
@export var dash_cooltime = 0.5

@export var afterimage : PackedScene

@onready var parent: Node2D = get_parent()
@onready var weapons = $Weapons
@onready var _sprite = $AnimatedSprite2D
@onready var dash = $Dash
@onready var gun = $Gun

func dash_effect():
	var afterimage = afterimage.instantiate()
	afterimage.position = position
	afterimage.scale = _sprite.scale
	afterimage.frame = _sprite.frame
	afterimage.flip_h = _sprite.flip_h
	
	get_tree().current_scene.add_child(afterimage)
	

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
	# sprite animating
	if input_direction:		_sprite.play("walk")
	else 			  :		_sprite.play("idle")
	
	if _sprite.global_position > get_global_mouse_position():
		_sprite.flip_h = true
	elif _sprite.global_position < get_global_mouse_position():
		_sprite.flip_h = false
	
	# dashing
	if Input.is_action_just_pressed("dash") and !dash.is_cooltime():
		dash_effect()
		dash.start_dash(dash_length)
		dash.start_dash_cooltime(dash_cooltime)
	velocity = input_direction * dash_speed if dash.is_dashing() else input_direction * speed

	# main attack
	if Input.is_action_pressed("main_attack"):
		gun.shoot()

func _physics_process(_delta):
	get_input()
	move_and_slide()
	
func on_death():
	pass
