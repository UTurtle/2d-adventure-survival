extends Sprite2D

var rand = RandomNumberGenerator.new()

@onready var _cursor = $Cursor

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func get_input():
	position = get_global_mouse_position()
	
	if Input.is_action_pressed("main_attack"):
		var rand_vec2 = Vector2(rand.randi_range(-1.0, 1.0), rand.randi_range(-1.0, 1.0))
		position = position + rand_vec2

func _physics_process(_delta):
	get_input()
	
func on_death():
	pass
