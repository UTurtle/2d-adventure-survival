extends Bullet

@export var graph_scale = 3
var start_position
var t = 0.0  # 경과 시간 추적 변수
var o

func _ready():
	super()
	start_position = position  # 태어난 위치 저장

func _process(_delta):
	t += _delta * graph_scale
	
	var r = 3 * sin(o * t)
	position = start_position + Vector2(r * cos(t), r * sin(t)) * speed
