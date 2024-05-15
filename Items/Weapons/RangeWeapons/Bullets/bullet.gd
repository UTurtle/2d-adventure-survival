extends Node2D
class_name Bullet

var speed = 250
var dur = 1
var damage = 1
var timer
	
func _ready():
	timer = Timer.new()
	self.add_child(timer)
	timer.wait_time = dur
	timer.connect("timeout", _on_timer_timeout)
	timer.start()

func _process(delta):
	position += transform.x * speed * delta

func _on_timer_timeout():	queue_free()

func _on_area_2d_area_entered(area):
	var entity = area.get_parent()
	if entity is Enemy:
		if entity.health > 0:
			entity.health -= damage
			queue_free()

