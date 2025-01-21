extends Node

@onready var left_trigger: AnimatableBody2D = $LeftTrigger
@onready var right_trigger: AnimatableBody2D = $RightTrigger

var left_pressed : bool = false
var right_pressed : bool = false
var rotation_angle:float = PI * 45 / 180



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.action_press("ui_left")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if(event is InputEventKey):
		if(event.keycode == KEY_LEFT):
			if(event.is_pressed() and not left_pressed):
				left_pressed = true
				_rotate_trigger(true, true)
			elif(event.is_released()and left_pressed):
				left_pressed = false
				_rotate_trigger(true, false)
		elif(event.keycode == KEY_RIGHT):
			if(event.is_pressed() and not right_pressed):
				right_pressed = true
				_rotate_trigger(false, true)
			elif(event.is_released() and right_pressed):
				right_pressed = false
				_rotate_trigger(false, false)
			
func _rotate_trigger(isLeft : bool, isPressed:bool) -> void:    
	var tween = get_tree().create_tween().set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.tween_property(left_trigger if isLeft else right_trigger,\
	"rotation", \
	rotation_angle * (-1 if isLeft else 1) if isPressed else 0.0,\
	0.05)
