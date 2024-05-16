extends PassiveSkill
class_name FurieBulletSkill

@export var bullet_speed = 10
@export var bullet_dur = 3
@export var bullet_damage = 1
@export var bullet_scale = Vector2(0.4, 0.4)
@export var cooltime = 0.01
var o = 0.0

@export var n = 1
@onready var shoot_pos = $ShootPos
const BULLET: PackedScene = preload("res://Items/Weapons/RangeWeapons/Bullets/furie_bullet.tscn")

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
	var b = BULLET.instantiate()
	b = set_bullet_property(b)
	
	b.o = o
	o = 0 if o > 8 else o + 0.01 
	o = 8 if 8 > o and o > 5 else o
	
	b.global_transform = shoot_pos.global_transform
	get_tree().root.add_child(b)
		

