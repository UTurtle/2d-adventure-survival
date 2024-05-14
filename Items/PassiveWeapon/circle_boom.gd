extends RangeWeapon

@onready var shoot_pos = $ShootPos
const ARROW_SCENE: PackedScene = preload("res://Items/Weapons/RangeWeapons/Bullets/bullet.tscn")

@onready var circle_boom_attack_timer = $CircleBoomAttackTimer
var circle_boom_n = 31

func _ready() -> void:
	self.visible = false
	
	circle_boom_attack_timer.wait_time = 0.7
	circle_boom_attack_timer.autostart = true
	circle_boom_attack_timer.connect("timeout", circle_boom_attack)
	circle_boom_attack_timer.start()
	
func is_equipment(isUsing) -> void:
	if isUsing:
		circle_boom_attack_timer.start()
	else:
		circle_boom_attack_timer.stop()
	
func circle_boom_attack() -> void:
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
	
