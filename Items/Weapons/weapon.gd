extends Node2D
class_name Weapon

@onready var _sprite = $Sprite2D

var attack_timer
var can_attack = true

func set_cooltime(cooltime):
	attack_timer.wait_time = cooltime

func _ready() -> void:
	self.visible = false
	
	attack_timer = Timer.new()
	self.add_child(attack_timer)
	attack_timer.wait_time = 0.1
	attack_timer.connect("timeout", update_can_attack)

func update_can_attack():
	can_attack = true

func start_attack() -> void:
	attack_timer.start()
	can_attack = false
	attack()

func attack():
	pass

func get_input():
	look_at(get_global_mouse_position())
	
	if _sprite.global_position > get_global_mouse_position():
		_sprite.flip_v = true
	elif _sprite.global_position < get_global_mouse_position():
		_sprite.flip_v = false
	
func _physics_process(_delta):
	get_input()
