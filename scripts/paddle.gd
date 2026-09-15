extends CharacterBody2D
class_name Paddle

@export var bounce_direction: Vector2
@onready var collision_shape = $CollisionShape2D
@onready var paddle_length = collision_shape.shape.size.x as float

func calculate_ball_bounce(ball_collision_position: Vector2) -> Vector2:
	var distance = global_position.x - ball_collision_position.x as float
	var angle_factor = distance / (paddle_length / 2) as float
	var angle = angle_factor * PI/4
	return bounce_direction.rotated(angle)
	
