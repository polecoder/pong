extends CharacterBody2D

var screen_size
var direction
@export var speed = 400

func _ready() -> void:
	screen_size = get_viewport_rect().size
	# velocidad inicial randomizada
	direction = Vector2.RIGHT.rotated(randf_range(0, TAU))
	velocity = direction * speed

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
