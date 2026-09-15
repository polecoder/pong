extends Node2D

@onready var body: CharacterBody2D = get_parent() as CharacterBody2D
@onready var movement_component: MovementComponent = body.find_child("MovementComponent") as Node2D

func _physics_process(delta: float) -> void:
	body.velocity = Vector2.ZERO
	if Input.is_action_pressed("move_left"):
		movement_component.handle_movement(Vector2.LEFT, delta)
	if Input.is_action_pressed("move_right"):
		movement_component.handle_movement(Vector2.RIGHT, delta)
