extends RangeWeapon

@onready var shoot_pos = $ShootPos
const BULLET: PackedScene = preload("res://Items/Weapons/RangeWeapons/Bullets/bullet.tscn")

var shoot_gun_n = 10

func _ready() -> void:
	super()
	set_cooltime(0.15)
	
func attack() -> void:
	for i in range(shoot_gun_n):
		var b = BULLET.instantiate()
		b = set_bullet_property(b)
		
		b.global_transform = shoot_pos.global_transform
		b.position = b.position + Vector2(10, 0).rotated(randf_range(0, 4*PI))
		get_tree().root.add_child(b)

func shoot_gun_attack_setting(n) -> void:
	shoot_gun_n = n
	
