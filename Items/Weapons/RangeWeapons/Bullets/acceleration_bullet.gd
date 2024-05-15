extends Bullet
class_name AccelerationBullet

@export var acceleration = 5

func _process(delta):
	super(delta)
	speed += acceleration
