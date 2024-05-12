extends Node2D
class_name RangeWeapon

@onready var _sprite = $Sprite2D

func get_input():
	look_at(get_global_mouse_position())
	
	if _sprite.global_position > get_global_mouse_position():
		_sprite.flip_v = true
	elif _sprite.global_position < get_global_mouse_position():
		_sprite.flip_v = false
	
func _physics_process(_delta):
	get_input()
