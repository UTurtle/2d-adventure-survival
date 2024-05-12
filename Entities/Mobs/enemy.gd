extends CharacterBody2D
class_name Enemy

@export var speed = 1
@onready var _sprite = $AnimatedSprite2D

func get_input():
	var player = get_parent().get_node("Player").get_node("CharacterBody2D")
	var distance = (player.position - position).normalized() * speed
	position += distance
	
	if 	distance:		_sprite.play("walk")
	else 		:		_sprite.play("idle")
	
	if distance.x < 0:
		_sprite.flip_h = true
	else:
		_sprite.flip_h = false
	
func _physics_process(_delta):
	get_input()
	move_and_slide()

	

#if Input.is_action_pressed("left"):
		#_sprite.flip_h = true
	#elif Input.is_action_pressed("right"):
		#_sprite.flip_h = false
