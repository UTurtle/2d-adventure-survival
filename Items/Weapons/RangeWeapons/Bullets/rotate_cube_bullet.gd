extends Bullet


@export var graph_scale = 10
var start_position
var t = 0.0  # 경과 시간 추적 변수

func _ready():
	super()
	start_position = position  # 태어난 위치 저장

func _process(_delta):
	# 경과 시간 업데이트
	t += _delta
	
	# 버터플라이 커브를 따라 이동하는 x와 y 좌표 계산
	var radius = graph_scale # 원의 반지름
	var angular_speed = speed # 원을 따라 회전하는 속도
	var angle = t * angular_speed # 각도는 시간에 비례하여 증가
	
	var x = cos(angle) * radius
	var y = sin(angle) * radius
	
	# 새로운 위치로 이동
	position = start_position + Vector2(x, y) * speed

