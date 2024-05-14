extends CharacterBody2D
class_name Player

#@onready var player = SaveData.players[0]
@export var speed = 100
@export var health = 10
@export var melee_damage = 1

@export var afterimage : PackedScene

@onready var parent: Node2D = get_parent()
@onready var weapons = $Weapons
@onready var _sprite = $AnimatedSprite2D
@onready var dash = $Dash
var main_weapon
var current_weapon_index = 0

func _ready():
	SaveData.health = health
	SaveData.score = 0
	switch_weapon(current_weapon_index, true)

# TODO: leveling system
func level_updated():
	pass
	
func sprite_lookat():
	if _sprite.global_position > get_global_mouse_position():
		_sprite.flip_h = true
	elif _sprite.global_position < get_global_mouse_position():
		_sprite.flip_h = false
		
# TODO: refactor weapon methods.
# TODO: set weapon main funcion -> attack, skill -> process

func change_weapon_input():
	if Input.is_action_just_pressed("1"):
		change_weapon(-1)
	elif Input.is_action_just_pressed("2"):
		change_weapon(+1)

func change_weapon(vector):
	var total_weapons = weapons.get_child_count()
	if total_weapons == 0:
		return

	switch_weapon(current_weapon_index, false)
	current_weapon_index = (current_weapon_index + vector + total_weapons) % total_weapons
	switch_weapon(current_weapon_index, true)

func switch_weapon(index, visible):
	main_weapon = weapons.get_child(index)
	if main_weapon:
		main_weapon.visible = visible
		main_weapon.set_process(false)
		
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
	if Input.is_action_pressed("main_attack") and main_weapon.can_attack:
		main_weapon.attack()
		

func dash_effect():
	var afterimage = afterimage.instantiate()
	afterimage.position = position
	afterimage.scale = _sprite.scale
	afterimage.frame = _sprite.frame
	afterimage.flip_h = _sprite.flip_h
	
	get_tree().current_scene.add_child(afterimage)

func _physics_process(_delta):
	get_input()
	change_weapon_input()
	sprite_lookat()
	move_and_slide()
	
func _process(delta):
	if SaveData.health <= 0:
		on_death()
		self.set_process(false)
		self.set_physics_process(false)	
	
func on_death():
	get_tree().reload_current_scene()
	
func on_hurt_box(area):
	var entity = area.get_parent()
	if entity is Enemy:
		if SaveData.health > 0:
			SaveData.health -= entity.melee_damage
