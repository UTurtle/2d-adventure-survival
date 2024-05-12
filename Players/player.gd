extends CharacterBody2D

@export var speed = 100
@export var health = 100

@export var afterimage : PackedScene

@onready var parent: Node2D = get_parent()
@onready var weapons = $Weapons
@onready var _sprite = $AnimatedSprite2D
@onready var dash = $Dash
@onready var gun = $Gun

func sprite_lookat():
	if _sprite.global_position > get_global_mouse_position():
		_sprite.flip_h = true
	elif _sprite.global_position < get_global_mouse_position():
		_sprite.flip_h = false

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
	# sprite animating
	if input_direction:		_sprite.play("walk")
	else 			  :		_sprite.play("idle")

	# dashing
	if Input.is_action_just_pressed("dash") and dash.count:
		dash_effect()
		dash.start_dash(dash.length, dash.cooltime)
	velocity = input_direction * dash.speed if dash.is_dashing() else input_direction * speed
	
	# main attack
	if Input.is_action_pressed("main_attack"):
		gun.shoot()
	

func dash_effect():
	var afterimage = afterimage.instantiate()
	afterimage.position = position
	afterimage.scale = _sprite.scale
	afterimage.frame = _sprite.frame
	afterimage.flip_h = _sprite.flip_h
	
	get_tree().current_scene.add_child(afterimage)

func _physics_process(_delta):
	get_input()
	sprite_lookat()
	move_and_slide()
	
func on_death():
	pass
