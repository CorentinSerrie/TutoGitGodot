extends StaticBody2D

var time_between_bumps : float = 1.0

var _is_ball_inside: bool = false
var _ball_entered_time: float
var _ball: Ball
	
func bump(body:Ball) -> void:
	var direction : Vector2 = (body.position - position).normalized()
	body.apply_central_impulse(direction*700)
	_is_ball_inside = true
	_ball_entered_time = Time.get_unix_time_from_system()
	_ball = body

func ball_exited(_body: Ball) -> void:
	print("exit")
	_is_ball_inside = false
	_ball = null

func _process(_delta: float) -> void:
	if(_is_ball_inside && _ball_entered_time + time_between_bumps < Time.get_unix_time_from_system()):
		_ball_entered_time = Time.get_unix_time_from_system()
		print("rebump")
		bump(_ball)
