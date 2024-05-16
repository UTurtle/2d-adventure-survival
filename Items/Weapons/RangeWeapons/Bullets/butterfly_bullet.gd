extends Bullet


@export var graph_scale = 3
var start_position
var t = 0.0  # 경과 시간 추적 변수

func _ready():
	super()
	start_position = position  # 태어난 위치 저장

func _process(_delta):
	# 경과 시간 업데이트
	t += _delta*graph_scale
	
	# 버터플라이 커브를 따라 이동하는 x와 y 좌표 계산
	var x = sin(t) * (exp(cos(t)) - 2 * cos(4 * t) - pow(sin(t / 12), 5))
	var y = cos(t) * (exp(cos(t)) - 2 * cos(4 * t) - pow(sin(t / 12), 5))
	
	# 새로운 위치로 이동
	position = start_position + Vector2(x, y) * speed

