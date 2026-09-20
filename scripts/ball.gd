extends CharacterBody2D

var direction
@export var initial_speed = 400
@export var speed_increase = 25
@export var initial_position = Vector2(240, 360)
var speed = initial_speed

func _ready() -> void:
	self.reset(0)


func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision && collision.get_collider() is Paddle:
		var paddle = collision.get_collider() as Paddle
		direction = paddle.calculate_ball_bounce(global_position)
		speed += speed_increase
		velocity = direction * speed
	elif collision:
		velocity = velocity.bounce(collision.get_normal())


func reset(time: int) -> void:
	# pausa para volver a empezar
	await get_tree().create_timer(time).timeout
	speed = initial_speed
	
	position = initial_position
	# velocidad inicial randomizada
	direction = generate_random_direction()
	velocity = direction * speed


func generate_random_direction() -> Vector2:
	var x = randf_range(-0.75, 0.75)
	var y = 1 if (randf() > 0.5) else -1
	return Vector2(x, y).normalized()
