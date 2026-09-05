extends CharacterBody2D

@onready var movement_component: MovementComponent = $MovementComponent
@onready var ball: CharacterBody2D = get_parent().find_child("Ball") as Node2D

func _ready() -> void:
	assert(ball != null, "Ball not found in main scene! This breaks the enemy script.")

func _physics_process(delta: float) -> void:
	# if the enemy is to the left of the ball, then move to the right and viceversa
	if position.x <= ball.position.x:
		movement_component.handle_movement(Vector2.RIGHT, delta)
	else:
		movement_component.handle_movement(Vector2.LEFT, delta)
