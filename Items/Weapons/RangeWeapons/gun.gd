extends RangeWeapon

@onready var shoot_pos = $ShootPos
const ARROW_SCENE: PackedScene = preload("res://Items/Weapons/RangeWeapons/Bullets/bullet.tscn")

func shoot() -> void:
	var b = ARROW_SCENE.instantiate()
	get_parent().get_parent().get_parent().add_child(b)
	b.global_transform = shoot_pos.global_transform
