extends Node2D

@onready var ball: CharacterBody2D = get_tree().current_scene.find_child("Ball") as Node2D
@onready var body: CharacterBody2D = get_parent() as CharacterBody2D
@onready var movement_component: MovementComponent = body.find_child("MovementComponent") as Node2D
@export var dead_zone_offset = 30 as float

func _ready() -> void:
	assert(ball != null, "Ball not found in main scene! This breaks the enemy script.")

func _physics_process(delta: float) -> void:
	# if the enemy is to the left of the ball, then move to the right and viceversa
	if body.position.x < ball.position.x - dead_zone_offset:
		movement_component.handle_movement(Vector2.RIGHT, delta)
	elif body.position.x > ball.position.x + dead_zone_offset:
		movement_component.handle_movement(Vector2.LEFT, delta)
	else:
		body.velocity = Vector2.ZERO
