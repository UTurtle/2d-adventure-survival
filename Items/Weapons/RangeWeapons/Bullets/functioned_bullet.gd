extends Bullet

func _process(_delta):
	var t = position.x  # t 값을 x로 사용
	var x = 100 * sin(t) * (exp(cos(t)) - 2 * cos(4 * t) - pow(sin(t / 12), 5))  # x 좌표 계산
	var y = 100 * cos(t) * (exp(cos(t)) - 2 * cos(4 * t) - pow(sin(t / 12), 5))  # y 좌표 계산
	var adjust_delta = Vector2(x, y)
	position += adjust_delta.normalized() * speed
	#position.rotated(_delta)
	
	
