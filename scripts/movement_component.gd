class_name MovementComponent
extends Node2D

@export var speed = 20000
@onready var body: CharacterBody2D = get_parent() as CharacterBody2D

func _ready() -> void:
	assert(body is CharacterBody2D, "MovementComponent must be a child of a CharacterBody2D!")

func handle_movement(direction: Vector2, delta: float) -> void:
	body.velocity = direction.normalized() * speed * delta
	body.move_and_slide()
