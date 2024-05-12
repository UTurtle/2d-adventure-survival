extends Node2D

@export var speed = 400
@export var length = 0.05
@export var cooltime = 0.5
@export var count = 2

@onready var timer = $DashTimer
var que = []

func start_dash(dur, cooltime):
	timer.wait_time = dur
	
	var cooltimer = Timer.new()
	add_child(cooltimer)
	cooltimer.wait_time = cooltime
	cooltimer.connect("timeout", _on_dash_cool_timer_timeout)
	que.append(cooltimer)
	count -= 1
	
	cooltimer.start() 
	timer.start() 
	
func is_dashing():
	return !timer.is_stopped()

func _on_dash_cool_timer_timeout():
	count += 1
	que.pop_front().queue_free()
