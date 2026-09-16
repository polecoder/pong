extends CharacterBody2D
class_name Paddle

@export var bounce_direction: Vector2
@export var max_bounce_angle = PI/4
@onready var collision_shape = $CollisionShape2D
@onready var paddle_length = collision_shape.shape.size.x as float
var is_enemy = false

func _ready():
	if self.has_node("EnemyComponent"): is_enemy = true

func calculate_ball_bounce(ball_collision_position: Vector2) -> Vector2:
	var distance = global_position.x - ball_collision_position.x
	var angle_factor = distance / (paddle_length / 2)
	var angle = angle_factor * max_bounce_angle
	
	if is_enemy: return bounce_direction.rotated(-angle)
	return bounce_direction.rotated(angle)
	
