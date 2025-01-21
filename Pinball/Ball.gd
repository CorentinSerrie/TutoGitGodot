class_name Ball

extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_body_entered(body: Node) -> void:
	if(body.has_method("bump")):
		body.bump(self)

func _on_body_exited(body: Node) -> void:
	if(body.has_method("ball_exited")):
		body.ball_exited(self)

func _input(event: InputEvent) -> void:
	if(event is InputEventKey):
		if(event.keycode == KEY_R && event.is_pressed()):
			PhysicsServer2D.body_set_state(get_rid(), PhysicsServer2D.BODY_STATE_TRANSFORM, Transform2D.IDENTITY.translated(get_global_mouse_position()))

			linear_velocity = Vector2.ZERO
			angular_velocity = 0.0
