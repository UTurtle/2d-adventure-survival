extends Bullet
class_name ShotgunBullet

var rotation_direction = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	rotation += rotation_direction

