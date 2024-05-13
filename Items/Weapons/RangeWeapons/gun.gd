extends RangeWeapon

@onready var shoot_pos = $ShootPos
const ARROW_SCENE: PackedScene = preload("res://Items/Weapons/RangeWeapons/Bullets/bullet.tscn")

@onready var shoot_gun_attack_timer = $ShotgunAttackTimer
var shoot_gun_n = 10

@onready var circle_boom_attack_timer = $CircleBoomAttackTimer
var circle_boom_n = 31

func _ready() -> void:
	shoot_gun_attack_timer.wait_time = 0.5
	shoot_gun_attack_timer.autostart = true
	shoot_gun_attack_timer.connect("timeout", shoot_gun_attack)
	shoot_gun_attack_timer.start()
	
	circle_boom_attack_timer.wait_time = 0.7
	circle_boom_attack_timer.autostart = true
	circle_boom_attack_timer.connect("timeout", circle_boom_attack)
	circle_boom_attack_timer.start()

func attack() -> void:
	var b = ARROW_SCENE.instantiate()
	get_tree().root.add_child(b)
	b.global_transform = shoot_pos.global_transform

func shoot_gun_attack() -> void:
	for i in range(shoot_gun_n):
		var b = ARROW_SCENE.instantiate()
		get_tree().root.add_child(b)
		
		b.global_transform = shoot_pos.global_transform
		b.position = b.position + Vector2(10, 0).rotated(randf_range(0, 2*PI))

func shoot_gun_attack_setting(wait_time, n) -> void:
	shoot_gun_attack_timer.stop()
	shoot_gun_attack_timer.wait_time = wait_time
	shoot_gun_attack_timer.start()
	
	shoot_gun_n = n
	
func circle_boom_attack() -> void:
	for i in range(circle_boom_n):
		var b = ARROW_SCENE.instantiate()
		get_tree().root.add_child(b)
		
	var step = 2 * PI / circle_boom_n
	
	for i in range(circle_boom_n):
		var spawn_point = ARROW_SCENE.instantiate()
		var pos = Vector2(circle_boom_n, 0).rotated(step * i)
		
		spawn_point.global_transform = shoot_pos.global_transform
		spawn_point.position += pos
		spawn_point.rotation += pos.angle()
		get_tree().root.add_child(spawn_point)
		
		

func circle_boom_attack_setting(wait_time, n) -> void:
	circle_boom_attack_timer.stop()
	circle_boom_attack_timer.wait_time = wait_time
	circle_boom_attack_timer.start()
	
	shoot_gun_n = n
