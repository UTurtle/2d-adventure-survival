extends CharacterBody2D
class_name Enemy

@export var health = 1
@export var speed = 1
@export var score = 1
@export var melee_damage = 1
@onready var _sprite = $AnimatedSprite2D
@onready var animation = $AnimationPlayer

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

func _process(_delta):
	if health <= 0:
		on_death()
		self.set_process(false)
		self.set_physics_process(false)

func on_death():
	SaveData.score += score
	animation.play("die")

#if Input.is_action_pressed("left"):
		#_sprite.flip_h = true
	#elif Input.is_action_pressed("right"):
		#_sprite.flip_h = false
