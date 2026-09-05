extends CharacterBody2D

@onready var movement_component: MovementComponent = $MovementComponent

func _physics_process(delta: float) -> void:
	velocity = Vector2.ZERO
	if Input.is_action_pressed("move_left"):
		movement_component.handle_movement(Vector2.LEFT, delta)
	if Input.is_action_pressed("move_right"):
		movement_component.handle_movement(Vector2.RIGHT, delta)
