extends RangeWeapon

@onready var shoot_pos = $ShootPos
const ARROW_SCENE: PackedScene = preload("res://Items/Weapons/RangeWeapons/Bullets/bullet.tscn")

@onready var shoot_gun_attack_timer = $ShotgunAttackTimer
var shoot_gun_n = 10

func _ready() -> void:
	self.visible = false
	#shoot_gun_attack_timer.wait_time = 0.5
	#shoot_gun_attack_timer.autostart = true
	#shoot_gun_attack_timer.connect("timeout", attack)
	#shoot_gun_attack_timer.start()

func attack() -> void:
	for i in range(shoot_gun_n):
		var b = ARROW_SCENE.instantiate()
		
		b.global_transform = shoot_pos.global_transform
		b.position = b.position + Vector2(10, 0).rotated(randf_range(0, 2*PI))
		get_tree().root.add_child(b)

func shoot_gun_attack_setting(wait_time, n) -> void:
	shoot_gun_attack_timer.stop()
	shoot_gun_attack_timer.wait_time = wait_time
	shoot_gun_attack_timer.start()
	
	shoot_gun_n = n
	
