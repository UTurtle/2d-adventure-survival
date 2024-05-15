extends RangeWeapon

@onready var shoot_pos = $ShootPos
const BULLET: PackedScene = preload("res://Items/Weapons/RangeWeapons/Bullets/acceleration_bullet.tscn")

func _ready() -> void:
	super()
	set_cooltime(0.05)

func attack():
	var b = BULLET.instantiate()
	b = set_bullet_property(b)
	get_tree().root.add_child(b)
	b.global_transform = shoot_pos.global_transform

