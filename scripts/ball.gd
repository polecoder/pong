extends CharacterBody2D

var direction
@export var speed = 400
@export var speed_increase = 25

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
		speed += speed_increase
		velocity = direction * speed
	elif collision:
		velocity = velocity.bounce(collision.get_normal())
