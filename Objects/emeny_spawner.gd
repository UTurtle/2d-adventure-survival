extends Node2D
class_name Spawner

@export var spawn_time = 3
@export var enmey : PackedScene = preload("res://Entities/Mobs/BasicMob/goblin.tscn")

@onready var timer = $Timer

func spawn():
	var e = enmey.instantiate()
	e.position = get_parent().get_node("Player").get_node("CharacterBody2D").position + Vector2(100, 0).rotated(randf_range(0, 2*PI))
	get_parent().add_child(e)
	
func set_timer():
	timer.stop()
	timer.wait_time = spawn_time
	timer.start()

func _ready():
	timer.wait_time = spawn_time
	timer.start()
	
func _on_timer_timeout():
	spawn()
	timer.start()
