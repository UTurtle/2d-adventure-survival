extends Weapon
class_name RangeWeapon

@export var bullet_speed = 300
@export var bullet_dur = 1
@export var bullet_damage = 1
@export var bullet_scale = Vector2(.5, .5)

func set_bullet_property(b):
	b.damage = bullet_damage
	b.dur = bullet_dur
	b.speed = bullet_speed
	b.get_child(0).scale = bullet_scale
	return b
