extends Node2D
class_name PassiveSkill

var attack_cooltimer

func get_input():
	look_at(get_global_mouse_position())
	
func _physics_process(_delta):
	get_input()

func _ready() -> void:
	attack_cooltimer = Timer.new()
	self.add_child(attack_cooltimer)
	attack_cooltimer.wait_time = 0.7
	attack_cooltimer.autostart = true
	attack_cooltimer.connect("timeout", passive_attack)
	attack_cooltimer.start()
	
func is_equipment(isUsing) -> void:
	if isUsing:
		attack_cooltimer.start()
	else:
		attack_cooltimer.stop()
	
func passive_attack() -> void:
	pass
		
func set_cooltime(wait_time) -> void:
	attack_cooltimer.stop()
	attack_cooltimer.wait_time = wait_time
	attack_cooltimer.start()
	
