extends CharacterBody2D

signal hit

@export var speed = 400
var screen_size


func _ready() -> void:
	screen_size = get_viewport_rect().size


func _physics_process(delta: float) -> void:
	velocity = Vector2.ZERO
	if Input.is_action_pressed("move_left"):
		velocity = Vector2.LEFT * speed
	if Input.is_action_pressed("move_right"):
		velocity = Vector2.RIGHT * speed
	move_and_slide()
