extends CharacterBody2D

var direction
@export var speed = 400

func _ready() -> void:
	# velocidad inicial randomizada
	direction = Vector2.RIGHT.rotated(randf_range(0, TAU))
	velocity = direction * speed

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision && collision.get_collider() is Paddle:
		var paddle = collision.get_collider() as Paddle
		direction = paddle.calculate_ball_bounce(global_position)
		print(direction)
		velocity = direction * speed
	elif collision:
		print(collision.get_collider())
		velocity = velocity.bounce(collision.get_normal())
