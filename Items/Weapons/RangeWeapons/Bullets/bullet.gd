extends Node2D
class_name Bullet

@export var speed = 250
@export var dur = 1
@onready var timer = $Timer

func _ready():
	timer.wait_time = dur
	timer.start()

func _process(delta):
	position += transform.x * speed * delta

func _on_timer_timeout():
	queue_free()

func _on_area_2d_area_entered(area):
	var entity = area.get_parent()
	if entity is Enemy:
		entity.get_node("AnimationPlayer").play("die")

