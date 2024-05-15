extends Node2D

@onready var timer = $Timer 
var power = 2.5
var is_knockbacking = false

func _process(_delta):
	pass
	
func start_knockback(knockback_power, dur=0.2):
	power = knockback_power
	timer.wait_time = dur
	timer.start() 
	is_knockbacking = true

func _on_timer_timeout():
	is_knockbacking = false
