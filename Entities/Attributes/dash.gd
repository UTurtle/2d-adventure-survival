extends Node2D

@onready var timer = $DashTimer
@onready var cooltimer = $DashCoolTimer

func start_dash(dur):
	timer.wait_time = dur
	timer.start() 
	
func start_dash_cooltime(cooltime):
	cooltimer.wait_time = cooltime
	cooltimer.start() 
	
func is_dashing():
	return !timer.is_stopped()

func is_cooltime():
	return !cooltimer.is_stopped()
