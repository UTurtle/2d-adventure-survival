extends PassiveSkill
class_name RotateCubeSkill

@export var bullet_speed = 5
@export var bullet_dur = 1.5
@export var bullet_damage = 1
@export var bullet_scale = Vector2(0.4, 0.4)
@export var cooltime = 0.05

@export var n = 31
@onready var shoot_pos = $ShootPos
const BULLET: PackedScene = preload("res://Items/Weapons/RangeWeapons/Bullets/rotate_cube_bullet.tscn")

func _ready():
	super()
	set_cooltime(cooltime) 

func set_bullet_property(b):
	b.damage = bullet_damage
	b.dur = bullet_dur
	b.speed = bullet_speed
	b.get_child(0).scale = bullet_scale
	return b

func passive_attack() -> void:
	for i in range(n):
		var b = BULLET.instantiate()
		b = set_bullet_property(b)
		
		b.global_transform = shoot_pos.global_transform
		get_tree().root.add_child(b)
		

