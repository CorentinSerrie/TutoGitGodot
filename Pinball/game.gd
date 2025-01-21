extends Node2D

const BUMPER = preload("res://bumper.tscn")

@export var wait_time : float
@export var min_x :float
@export var max_x :float
@export var min_y :float
@export var max_y :float

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var timer := Timer.new()
	timer.wait_time = wait_time
	timer.autostart = true
	timer.timeout.connect(create_bumper)
	add_child(timer)
	pass # Replace with function body.

func create_bumper()->void:
	var new_bumper = BUMPER.instantiate()
	add_child(new_bumper)
	new_bumper.position = Vector2(rng.randf_range(min_x, max_x), rng.randf_range(min_y, max_y))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func spawn_collider() -> void:
	pass
