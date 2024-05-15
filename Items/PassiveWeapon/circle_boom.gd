extends PassiveWeapon
class_name CircleBoom

@export var bullet_speed = 100
@export var bullet_dur = 1
@export var bullet_damage = 1
@export var bullet_scale = Vector2(0.4, 0.4)

@export var circle_boom_n = 31
@onready var shoot_pos = $ShootPos
const BULLET: PackedScene = preload("res://Items/Weapons/RangeWeapons/Bullets/bullet.tscn")

func set_bullet_property(b):
	b.damage = bullet_damage
	b.dur = bullet_dur
	b.speed = bullet_speed
	b.get_child(0).scale = bullet_scale
	return b

func passive_attack() -> void:
	var step = 2 * PI / circle_boom_n
	
	for i in range(circle_boom_n):
		var b = BULLET.instantiate()
		var pos = Vector2(circle_boom_n, 0).rotated(step * i)
		
		b = set_bullet_property(b)
		
		b.global_transform = shoot_pos.global_transform
		b.position += pos
		b.rotation += pos.angle()
		get_tree().root.add_child(b)

	
