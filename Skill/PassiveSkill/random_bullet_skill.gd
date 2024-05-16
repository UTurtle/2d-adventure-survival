extends PassiveSkill
class_name RandomBulletSkill

@export var bullet_speed = 5
@export var bullet_dur = 2
@export var bullet_damage = 1
@export var bullet_scale = Vector2(0.4, 0.4)
@export var cooltime = 3

@export var n = 100
@onready var shoot_pos = $ShootPos
@export var BULLET = preload("res://Items/Weapons/RangeWeapons/Bullets/bullet.tscn")

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
	
	var step = 2 * PI / n
	for t in range(n):
		var b = BULLET.instantiate()
		
		var pos = Vector2(n/2, 0).rotated(step * t)
		var x = 8 * cos(t) - 6 * cos(8 * t / 3)
		var y = 8 * sin(t) - 6 * sin(8 * t / 3)
		
		b = set_bullet_property(b)
		
		b.global_transform = shoot_pos.global_transform
		b.position += Vector2(x*sqrt(n), y*sqrt(n))
		b.rotation += pos.angle()
		get_tree().root.add_child(b)
		
