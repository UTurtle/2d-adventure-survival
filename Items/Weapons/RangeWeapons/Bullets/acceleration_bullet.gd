extends Bullet
class_name AccelerationBullet

@export var acceleration = 0.5

func _process(delta):
	super(delta)
	speed += acceleration
