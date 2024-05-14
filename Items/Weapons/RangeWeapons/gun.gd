extends RangeWeapon

@onready var shoot_pos = $ShootPos
const ARROW_SCENE: PackedScene = preload("res://Items/Weapons/RangeWeapons/Bullets/bullet.tscn")

@onready var gun_attack_timer = $GunAttackTimer
var can_attack = true

#@onready var circle_boom_attack_timer = $CircleBoomAttackTimer
#var circle_boom_n = 31

func _ready() -> void:
	self.visible = false
	gun_attack_timer.wait_time = 0.05
	gun_attack_timer.connect("timeout", update_can_attack)

func update_can_attack():
	can_attack = true

func attack() -> void:
	gun_attack_timer.start()
	can_attack = false
	var b = ARROW_SCENE.instantiate()
	get_tree().root.add_child(b)
	b.global_transform = shoot_pos.global_transform

#func shoot_gun_attack() -> void:
	#for i in range(shoot_gun_n):
		#var b = ARROW_SCENE.instantiate()
		#
		#b.global_transform = shoot_pos.global_transform
		#b.position = b.position + Vector2(10, 0).rotated(randf_range(0, 2*PI))
		#get_tree().root.add_child(b)
#
#func shoot_gun_attack_setting(wait_time, n) -> void:
	#shoot_gun_attack_timer.stop()
	#shoot_gun_attack_timer.wait_time = wait_time
	#shoot_gun_attack_timer.start()
	#
	#shoot_gun_n = n
	#
#func circle_boom_attack() -> void:
	#var step = 2 * PI / circle_boom_n
	#
	#for i in range(circle_boom_n):
		#var spawn_point = ARROW_SCENE.instantiate()
		#var pos = Vector2(circle_boom_n, 0).rotated(step * i)
		#
		#spawn_point.global_transform = shoot_pos.global_transform
		#spawn_point.position += pos
		#spawn_point.rotation += pos.angle()
		#get_tree().root.add_child(spawn_point)
		#
#func circle_boom_attack_setting(wait_time, n) -> void:
	#circle_boom_attack_timer.stop()
	#circle_boom_attack_timer.wait_time = wait_time
	#circle_boom_attack_timer.start()
	#
	#shoot_gun_n = n
